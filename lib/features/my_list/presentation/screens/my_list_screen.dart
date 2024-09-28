import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocaby/core/widgets/my_app_bar.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/no_vocab_body.dart';
import 'package:vocaby/features/my_list/presentation/screens/components/vocab_body.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: context.watch<MyListCubit>().vocablist.isEmpty
          ? const NoVocabBody()
          : const VocabBody(),
    );
  }
}
