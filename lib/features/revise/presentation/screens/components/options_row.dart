import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';

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
            onTap: () {
              context.read<ReviseCubit>().check(value)
                  ? Fluttertoast.showToast(
                      msg: "Correct ✔",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.sp)
                  : Fluttertoast.showToast(
                      msg: "Wrong X",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.redAccent,
                      textColor: Colors.white,
                      fontSize: 16.sp);
            },
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
