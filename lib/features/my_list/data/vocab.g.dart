// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocab.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VocabAdapter extends TypeAdapter<Vocab> {
  @override
  final int typeId = 0;

  @override
  Vocab read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vocab(
      artikel: fields[0] as String,
      noun: fields[1] as String,
      arabicTranslation: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Vocab obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.artikel)
      ..writeByte(1)
      ..write(obj.noun)
      ..writeByte(2)
      ..write(obj.arabicTranslation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VocabAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
