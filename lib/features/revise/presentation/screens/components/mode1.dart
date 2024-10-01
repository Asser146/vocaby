import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/components/artikel_options_row.dart';
import 'package:vocaby/features/revise/presentation/screens/components/guide_text.dart';
import 'package:vocaby/features/revise/presentation/screens/components/score_tracker.dart';

class Mode1 extends StatelessWidget {
  const Mode1({
    super.key,
    required this.vocab,
  });

  final Vocab vocab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => context.read<ReviseCubit>().changeMode(),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFFA726),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  child: Text(
                    "Switch To Mode 2",
                    style: TextStyles.nounStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        GradientBorderContainer(
          borderRadius: BorderRadius.circular(20.r),
          edgeInsets: EdgeInsets.all(2.r),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Text(
                "Guess The Artikel",
                style: TextStyles.titleLargeDarkMode,
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Text(
          vocab.noun,
          style: TextStyles.titleLargeDarkMode
              .copyWith(fontSize: 20.sp, fontWeight: FontWeightHelper.regular),
        ),
        SizedBox(height: 30.h),
        const ArtikelOptionsRow(),
        SizedBox(height: 35.h),
        GuideText(vocab: vocab, isTranslation: false),
        GuideText(vocab: vocab, isTranslation: true),
        SizedBox(height: 35.h),
        const ScoreTracker()
      ],
    );
  }
}
