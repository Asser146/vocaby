import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/add_vocab/cubit/add_vocab_cubit.dart';

class VocabTextField extends StatelessWidget {
  const VocabTextField({
    super.key,
    required this.isTranslation,
    required this.controller,
  });
  final TextEditingController controller;
  final bool isTranslation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText:
              isTranslation ? "Type Noun in Arabic" : "Type Noun in German",
          hintStyle: TextStyles.hintStyle,
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: ColorsManager.primaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: ColorsManager.secondaryColor, width: 2.0),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
