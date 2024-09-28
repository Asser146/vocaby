import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_card.dart';

class VocabBody extends StatelessWidget {
  const VocabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          ArtikelTabBar(),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<MyListCubit>().vocablist.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 8.h),
                    VocabCard(
                        vocab: context.watch<MyListCubit>().vocablist[index]),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ArtikelTabBar extends StatelessWidget {
  const ArtikelTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of categories
      child: TabBar(
        onTap: (index) {
          context.read<MyListCubit>().changeTab(index);
        },
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        dividerColor: Colors.transparent, // Removes the default line indicator
        unselectedLabelColor: Theme.of(context).cardColor,
        indicator: const BoxDecoration(), // Removes the default indicator
        tabs: artikel.map(
          (currentArtikel) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.w), // Adds space between tabs
              child: Tab(
                child: Container(
                  width: 30.r,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: ColorsManager.getArtikelColor(currentArtikel),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
