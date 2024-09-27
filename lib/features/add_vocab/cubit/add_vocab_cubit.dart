import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'add_vocab_state.dart';

class AddVocabCubit extends Cubit<AddVocabState> {
  String currentArtikel = artikel[0];
  TextEditingController nounController = TextEditingController();
  TextEditingController translationController = TextEditingController();
  final VocabStorage storage;
  AddVocabCubit(this.storage) : super(AddVocabInitial(artikel: artikel[0]));

  TextStyle getArtikleStyle(String value) {
    return value == artikel[0]
        ? TextStyles.nounDerStyle
        : value == artikel[1]
            ? TextStyles.nounDieStyle
            : TextStyles.nounDasStyle;
  }

  void changeArtikel(String newArtikel) {
    currentArtikel = newArtikel;
    emit(AddVocabArtikelChanged(artikel: currentArtikel));
  }

  bool validate() {
    if (nounController.text.isEmpty || translationController.text.isEmpty) {
      return false;
    } else {
      String noun = nounController.text;
      String translation = translationController.text;

      Vocab newVocab = Vocab(
        artikel: currentArtikel,
        noun: noun,
        arabicTranslation: translation,
      );

      // Save the vocab
      storage.addVocab(newVocab);

      // Clear the text controllers after saving
      nounController.clear();
      translationController.clear();

      // Start animation
      emit(AddVocabAnimation(startAnimation: true));

      return true;
    }
  }
}
