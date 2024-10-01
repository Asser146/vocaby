import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocaby/core/di/dependency_injection.dart';
import 'package:vocaby/core/routing/app_router.dart';
import 'package:vocaby/core/routing/routes.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // Initialize Hive and open the vocab box
  await VocabStorage().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter(); //

    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor:
                  const Color.fromARGB(255, 242, 217, 180)),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute, // Use AppRouter here
          initialRoute: Routes.home, // Set the initial route
        );
      },
    );
  }
}
