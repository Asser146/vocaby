import 'package:hive_flutter/hive_flutter.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';

class VocabStorage {
  static const String _vocabBox = 'vocabBox';

  // Initialize Hive
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(VocabAdapter());
    await Hive.openBox<Vocab>(_vocabBox);
  }

  // Add a new vocab to the list and save it to Hive
  Future<void> addVocab(Vocab newVocab) async {
    var box = Hive.box<Vocab>(_vocabBox);
    await box.add(newVocab); // Adds the new vocab to Hive
  }

  Future<void> deleteVocab(Vocab newVocab) async {
    var box = Hive.box<Vocab>(_vocabBox);
    await box.delete(newVocab);
  }

  // Load the vocab list from Hive
  List<Vocab> loadVocabList() {
    var box = Hive.box<Vocab>(_vocabBox);
    return box.values.toList();
  }

  // Save the entire vocab list (if you want to overwrite everything)
  Future<void> saveVocabList(List<Vocab> vocabList) async {
    var box = Hive.box<Vocab>(_vocabBox);
    await box.clear(); // Clear existing entries
    await box.addAll(vocabList); // Add all new entries
  }
}
