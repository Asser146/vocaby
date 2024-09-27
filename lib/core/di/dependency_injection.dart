import 'package:get_it/get_it.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<VocabStorage>(() => VocabStorage());
}
