import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';

class OptionsRow extends StatelessWidget {
  const OptionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (var value in artikel)
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: ColorsManager.getArtikelColor(value),
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: Text(
                value,
                style: TextStyles.buttonTextWhite,
              ),
            ),
          ),
      ],
    );
  }
}
