import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/add_vocab/cubit/add_vocab_cubit.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';

class ArtikelSelector extends StatelessWidget {
  const ArtikelSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Choose Artikel", style: TextStyles.nounStyle),
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: ColorsManager.thirdColor, // Border color
                width: 2.w,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: context.watch<AddVocabCubit>().currentArtikel,
                iconSize: 30.sp,
                items: artikel.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: context
                            .read<AddVocabCubit>()
                            .getArtikleStyle(value)),
                  );
                }).toList(),
                onChanged: (String? value) {
                  context.read<AddVocabCubit>().changeArtikel(value!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
