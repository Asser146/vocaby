import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/components/mode1.dart';
import 'package:vocaby/features/revise/presentation/screens/components/mode2.dart';

class ReviseScreen extends StatelessWidget {
  const ReviseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: context.watch<ReviseCubit>().testQueue.isEmpty
          ? Center(
              child: TextButton(
                  onPressed: () => context.read<ReviseCubit>().loadList(),
                  child: Text("Click here to Start Again",
                      style: TextStyles.nounStyle)),
            )
          : Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Builder(builder: (context) {
                final vocab = context.read<ReviseCubit>().current;
                final mode1 = context.watch<ReviseCubit>().mode1;
                return mode1 ? Mode1(vocab: vocab) : Mode2(vocab: vocab);
              }),
            ),
    );
  }
}
