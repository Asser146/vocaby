import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/routing.dart/routes.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back1.png"),
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const OptionButton(
                title: "My List",
                routeName: Routes.myList,
              ),
              SizedBox(height: 30.h),
              const OptionButton(
                title: "Revise Your Vocab",
                routeName: Routes.revise,
              ),
              SizedBox(height: 30.h),
              const OptionButton(
                title: "Add More Vocab",
                routeName: Routes.addVocav,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.title,
    required this.routeName,
  });
  final String title;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
              color: ColorsManager.thirdColor.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(20.sp))),
          child: Center(
            child: Text(
              title,
              style: TextStyles.buttonTextWhite,
            ),
          ),
        ),
      ),
    );
  }
}
