import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/no_vocab_body.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_card.dart';

class VocabList extends StatelessWidget {
  const VocabList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: context.watch<MyListCubit>().artikelList.isEmpty
          ? const NoVocabBody()
          : ListView.builder(
              itemCount: context.watch<MyListCubit>().isSearchActive
                  ? context.watch<MyListCubit>().filteredVocab.length
                  : context.watch<MyListCubit>().artikelList.length,
              itemBuilder: (context, index) {
                final list = context.watch<MyListCubit>().isSearchActive
                    ? context.watch<MyListCubit>().filteredVocab
                    : context.watch<MyListCubit>().artikelList;
                return Column(
                  children: [
                    SizedBox(height: 8.h),
                    VocabCard(vocab: list[index]),
                  ],
                );
              },
            ),
    );
  }
}
