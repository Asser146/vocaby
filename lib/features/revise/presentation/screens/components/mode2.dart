import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/components/arabic_options_row.dart';
import 'package:vocaby/features/revise/presentation/screens/components/score_tracker.dart';

class Mode2 extends StatelessWidget {
  const Mode2({
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
                    color: Color(0xffFFA726),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                  child: Text(
                    "Switch To Mode 1",
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
                "What is This?",
                style: TextStyles.titleLargeDarkMode,
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Text(
          "${vocab.artikel} ${vocab.noun} ",
          style: TextStyles.titleLargeDarkMode
              .copyWith(fontSize: 20.sp, fontWeight: FontWeightHelper.regular),
        ),
        SizedBox(height: 30.h),
        const ArabicOptionsRow(),
        SizedBox(height: 169.h),
        const ScoreTracker()
      ],
    );
  }
}
