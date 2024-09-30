import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/components/score_box.dart';

class ScoreTracker extends StatelessWidget {
  const ScoreTracker({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubitRead = context.read<ReviseCubit>();
    final cubitWatch = context.watch<ReviseCubit>();

    return Expanded(
      child: GradientBorderContainer(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(60.r), topLeft: Radius.circular(60.r)),
        edgeInsets: EdgeInsets.only(left: 2.r, right: 2.r, top: 3.r),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60.r),
                  topLeft: Radius.circular(60.r))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "${cubitWatch.currentIndex} / ${cubitRead.vocabList.length}",
                  style: TextStyles.titleLargeDarkMode,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScoreBox(isCheck: true),
                  ScoreBox(isCheck: false),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
