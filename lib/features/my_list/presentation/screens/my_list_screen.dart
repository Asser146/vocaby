import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_card.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: context.watch<MyListCubit>().vocablist.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/emptyVocab.png",
                    width: 100.h,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 60.h),
                  Text("No Vocab in The list", style: TextStyles.nounStyle),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ListView.builder(
                itemCount: context.watch<MyListCubit>().vocablist.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 8.h),
                      VocabCard(
                          vocab: context.watch<MyListCubit>().vocablist[index]),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
