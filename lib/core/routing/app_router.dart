import 'package:flutter/material.dart';
import 'package:vocaby/core/di/dependency_injection.dart';
import 'package:vocaby/core/routing/routes.dart';
import 'package:vocaby/features/add_vocab/cubit/add_vocab_cubit.dart';
import 'package:vocaby/features/add_vocab/screens/add_vocab_screen.dart';
import 'package:vocaby/features/home/home_screen.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';
import 'package:vocaby/features/my_list/presentation/cubit/my_list_cubit.dart';
import 'package:vocaby/features/my_list/presentation/screens/my_list_screen.dart';
import 'package:vocaby/features/revise/presentation/cubit/revise_cubit.dart';
import 'package:vocaby/features/revise/presentation/screens/revise_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // Add other routes here

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.addVocav:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddVocabCubit(getIt<VocabStorage>()),
                  child: const AddVocabScreen(),
                ));
      case Routes.revise:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ReviseCubit(getIt<VocabStorage>()),
                  child: const ReviseScreen(),
                ));
      case Routes.myList:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MyListCubit(getIt<VocabStorage>()),
                  child: const MyListScreen(),
                ));
      // Add other case statements for more screens
      default:
        return null; // Or a 404 screen
    }
  }
}
