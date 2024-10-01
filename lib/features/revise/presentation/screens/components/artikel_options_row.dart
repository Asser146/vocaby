import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/gradient_border_container.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';

class ArtikelOptionsRow extends StatelessWidget {
  const ArtikelOptionsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBorderContainer(
      borderRadius: BorderRadius.circular(0),
      edgeInsets: EdgeInsets.only(
        top: 2.r,
        bottom: 2.r,
      ),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
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
          ),
        ),
      ),
    );
  }
}
