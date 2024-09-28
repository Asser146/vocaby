import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';

class TextStyles {
  static TextStyle nounStyle = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Circular Std',
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle nounDerStyle =
      nounStyle.copyWith(color: ColorsManager.derColor);
  static TextStyle nounDieStyle =
      nounStyle.copyWith(color: ColorsManager.dieColor);
  static TextStyle nounDasStyle =
      nounStyle.copyWith(color: ColorsManager.dasColor);

  static TextStyle titleLargeDarkMode = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Circular Std',
    color: Colors.white,
  );
  static TextStyle hintStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: 'Circular Std',
    color: Colors.grey,
  );

  static TextStyle buttonTextWhite = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: 'Circular Std',
    color: Colors.white,
  );

  static TextStyle getArtikleStyle(String value) {
    return value == artikel[0]
        ? TextStyles.nounDerStyle
        : value == artikel[1]
            ? TextStyles.nounDieStyle
            : TextStyles.nounDasStyle;
  }
}
