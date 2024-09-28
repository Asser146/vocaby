import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarHeight: 40.h,
      // Apply a gradient background
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorsManager.primaryColor, // Black
              ColorsManager.secondaryColor, // Red
              ColorsManager.thirdColor, // Yellow
            ],
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "Vocaby",
        style: TextStyles.buttonTextWhite.copyWith(fontSize: 20.sp),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
