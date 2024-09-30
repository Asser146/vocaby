import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/theming/colors.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/add_vocab/cubit/add_vocab_cubit.dart';
import 'package:vocaby/features/add_vocab/screens/components/add_button.dart';
import 'package:vocaby/features/add_vocab/screens/components/artikel_selector.dart';
import 'package:vocaby/features/add_vocab/screens/components/vocab_text_field.dart';

class AddVocabScreen extends StatelessWidget {
  const AddVocabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 40.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.backgroundGrey ,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
              ),
              child: Center(
                child: Column(
                  children: [
                    const ArtikelSelector(),
                    SizedBox(height: 10.h),
                    VocabTextField(
                        isTranslation: false,
                        controller:
                            context.read<AddVocabCubit>().nounController),
                    SizedBox(height: 25.h),
                    VocabTextField(
                        isTranslation: true,
                        controller: context
                            .read<AddVocabCubit>()
                            .translationController),
                    SizedBox(height: 8.h),
                    const AddButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
