import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Container(
          decoration: BoxDecoration(
              color: ColorsManager.backgroundGrey,
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          // width: double.infinity,
          height: 45.h, // Adjust height if needed
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              cursorColor: ColorsManager.primaryColor,
              onChanged: (query) {
                context.read<MyListCubit>().search(query);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type to Search ...',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
