import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/artikel_tab_bar.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/search_field.dart';

class ModesRow extends StatelessWidget {
  const ModesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        context.watch<MyListCubit>().isSearchActive
            ? const SearchField()
            : const ArtikelTabBar(),
        IconButton(
          onPressed: () => context.read<MyListCubit>().toggleSearch(),
          icon: Icon(
            context.watch<MyListCubit>().isSearchActive
                ? Icons.cancel_sharp
                : Icons.search,
            size: 30.sp,
          ),
        )
      ],
    );
  }
}
