import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    super.key,
    required this.isCheck,
  });

  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    final cubitWatch = context.watch<ReviseCubit>();
    final themeColor = isCheck ? Colors.green : Colors.red;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: themeColor, // Border color
          width: 2.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: Column(
          children: [
            Icon(isCheck ? Icons.check : Icons.cancel,
                color: themeColor, size: 30.sp),
            SizedBox(height: 15.h),
            Text(
                isCheck
                    ? cubitWatch.correctNumber.toString()
                    : cubitWatch.falseNumber.toString(),
                style: TextStyles.nounStyle
                    .copyWith(fontWeight: FontWeightHelper.light))
          ],
        ),
      ),
    );
  }
}
