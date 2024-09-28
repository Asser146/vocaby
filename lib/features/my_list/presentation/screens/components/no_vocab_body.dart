import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';

class NoVocabBody extends StatelessWidget {
  const NoVocabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/emptyVocab.png",
            width: 100.h,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 60.h),
          Text("No Vocab in The list", style: TextStyles.nounStyle),
        ],
      ),
    );
  }
}
