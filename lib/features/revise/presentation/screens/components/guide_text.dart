import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';

class GuideText extends StatelessWidget {
  const GuideText({
    super.key,
    required this.vocab,
    required this.isTranslation,
  });

  final Vocab vocab;
  final bool isTranslation;
  @override
  Widget build(BuildContext context) {
    final borderRadius = isTranslation
        ? BorderRadius.only(
            topLeft: Radius.circular(20.r), bottomLeft: Radius.circular(20.r))
        : BorderRadius.only(
            topRight: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r));
    return Row(
      mainAxisAlignment:
          isTranslation ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        GradientBorderContainer(
          borderRadius: borderRadius,
          edgeInsets: EdgeInsets.only(
              top: 2.r,
              bottom: 2.r,
              left: isTranslation ? 2.r : 0,
              right: isTranslation ? 0 : 2.r),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: borderRadius),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Text(
                isTranslation ? vocab.arabicTranslation : "Meaning in Arabic :",
                style: TextStyles.nounStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
