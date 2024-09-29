import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/search_field.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_card.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Dialog(
        // backgroundColor: const Color.fromARGB(255, 230, 228, 221),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SearchField(),
            context.watch<MyListCubit>().filteredVocab.isEmpty
                ? Text("Search")
                : Expanded(
                    child: ListView.builder(
                      itemCount:
                          context.watch<MyListCubit>().filteredVocab.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 8.h),
                            VocabCard(
                                vocab: context
                                    .watch<MyListCubit>()
                                    .filteredVocab[index]),
                          ],
                        );
                      },
                    ),
                  ),
            // : Expanded(
            //     child: ListView.builder(
            //       itemCount:
            //           context.watch<MyListCubit>().filteredVocab.length,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             SizedBox(height: 8.h),
            //             VocabCard(
            //                 vocab: context
            //                     .watch<MyListCubit>()
            //                     .filteredVocab[index]),
            //           ],
            //         );
            //       },
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
