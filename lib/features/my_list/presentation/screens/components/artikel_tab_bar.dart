import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';

class ArtikelTabBar extends StatelessWidget {
  const ArtikelTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 6.h),
      child: DefaultTabController(
        length: 3, // Number of categories
        child: TabBar(
          onTap: (index) {
            context.read<MyListCubit>().changeTab(index);
          },
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          dividerColor:
              Colors.transparent, // Removes the default line indicator
          unselectedLabelColor: Theme.of(context).cardColor,
          indicator: const BoxDecoration(), // Removes the default indicator
          tabs: artikel.map(
            (currentArtikel) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w), // Adds space between tabs
                child: Tab(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            color:
                                ColorsManager.getArtikelColor(currentArtikel),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        child: Text(currentArtikel,
                            style: TextStyles.buttonTextWhite),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
