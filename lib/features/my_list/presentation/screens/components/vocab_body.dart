import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/di/dependency_injection.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/artikel_tab_bar.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/no_vocab_body.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/search_dialog.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_card.dart';

class VocabBody extends StatelessWidget {
  const VocabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ArtikelTabBar(),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider(
                        create: (context) => MyListCubit(getIt<VocabStorage>()),
                        child: const SearchDialog(),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 30.sp,
                ),
              )
            ],
          ),
          Expanded(
            child: context.watch<MyListCubit>().artikelList.isEmpty
                ? const NoVocabBody()
                : ListView.builder(
                    itemCount: context.watch<MyListCubit>().artikelList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: 8.h),
                          VocabCard(
                              vocab: context
                                  .watch<MyListCubit>()
                                  .artikelList[index]),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
