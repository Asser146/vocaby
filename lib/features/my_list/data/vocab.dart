import 'package:hive/hive.dart';

part 'vocab.g.dart'; // Required for Hive type adapter

@HiveType(typeId: 0)
class Vocab {
  @HiveField(0)
  final String artikel;
  @HiveField(1)
  final String noun;
  @HiveField(2)
  final String arabicTranslation;
  Vocab(
      {required this.artikel,
      required this.noun,
      required this.arabicTranslation});
}
