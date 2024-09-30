import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.title,
    required this.routeName,
    required this.order,
  });
  final String title;
  final String routeName;
  final int order;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Color(0xff000000),
      Color(0xffDD0000),
      Color(0xffFFCC00)
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
              color: colors[order].withOpacity(0.9),
              borderRadius: BorderRadius.all(Radius.circular(20.sp))),
          child: Center(
            child: Text(
              title,
              style: TextStyles.buttonTextWhite
                  .copyWith(fontWeight: FontWeightHelper.bold),
            ),
          ),
        ),
      ),
    );
  }
}
