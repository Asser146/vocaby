import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 40.h,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(22.sp),
      //     bottomRight: Radius.circular(22.sp),
      //   ),
      // ),
      backgroundColor: ColorsManager.secondaryColor.withOpacity(0.8),
      centerTitle: true,
      title: Text("Vocaby",
          style: TextStyles.buttonTextWhite.copyWith(fontSize: 20.sp)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
