import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/routing/routes.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/home/components/option_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 0.54 * MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pic.png"),
                fit: BoxFit.cover, // Ensures the image covers the entire screen
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 0.27 * MediaQuery.of(context).size.height),
              child: Text(
                "Your Way To Learn\nGerman",
                textAlign: TextAlign.center,
                style: TextStyles.buttonTextWhite.copyWith(fontSize: 27.sp),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 0.5 * MediaQuery.of(context).size.height),
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 78, 77, 77),
                      Color.fromARGB(255, 57, 116, 59),
                      // Yellow
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.r),
                      topLeft: Radius.circular(30.r))),
              child: const Column(
                children: [
                  Spacer(),
                  OptionButton(
                    title: "My List",
                    routeName: Routes.myList,
                    order: 0,
                  ),
                  Spacer(),
                  OptionButton(
                    title: "Revise",
                    routeName: Routes.revise,
                    order: 1,
                  ),
                  Spacer(),
                  OptionButton(
                    title: "Add Vocab",
                    routeName: Routes.addVocav,
                    order: 2,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
