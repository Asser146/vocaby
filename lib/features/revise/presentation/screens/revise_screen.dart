import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/font_weight_helper.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/revise/presentation/screens/components/options_row.dart';

class ReviseScreen extends StatelessWidget {
  const ReviseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
          child: Column(
            children: [
              Text(
                "Guess the Artikel",
                style: TextStyles.titleLargeDarkMode,
              ),
              SizedBox(height: 60.h),
              Text(
                "Autoasasaasas",
                style: TextStyles.titleLargeDarkMode.copyWith(
                    fontSize: 20.sp, fontWeight: FontWeightHelper.regular),
              ),
              SizedBox(height: 60.h),
              const OptionsRow(),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Text(
                    "Meaning in Arabic :",
                    style: TextStyles.nounStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "يشسشس",
                    style: TextStyles.nounStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
