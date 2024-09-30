import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/components/guide_text.dart';
import 'package:vocaby/features/revise/presentation/screens/components/options_row.dart';
import 'package:vocaby/features/revise/presentation/screens/components/score_tracker.dart';

class ReviseScreen extends StatelessWidget {
  const ReviseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: context.watch<ReviseCubit>().testQueue.isEmpty
            ? TextButton(
                onPressed: () => context.read<ReviseCubit>().loadList(),
                child: Text("Click here to Start Again",
                    style: TextStyles.nounStyle))
            : Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Builder(builder: (context) {
                  final vocab = context.read<ReviseCubit>().current;
                  return Column(
                    children: [
                      GradientBorderContainer(
                        borderRadius: BorderRadius.circular(20.r),
                        edgeInsets: EdgeInsets.all(2.r),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Text(
                              "Guess the Artikel",
                              style: TextStyles.titleLargeDarkMode,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60.h),
                      Text(
                        vocab.noun,
                        style: TextStyles.titleLargeDarkMode.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeightHelper.regular),
                      ),
                      SizedBox(height: 40.h),
                      const OptionsRow(),
                      SizedBox(height: 40.h),
                      GuideText(vocab: vocab, isTranslation: false),
                      GuideText(vocab: vocab, isTranslation: true),
                      SizedBox(height: 40.h),
                      const ScoreTracker()
                    ],
                  );
                }),
              ),
      ),
    );
  }
}
