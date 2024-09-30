import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vocaby/core/theming/styles.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'my_list_state.dart';

class MyListCubit extends Cubit<MyListState> {
  List<Vocab> vocablist = [], artikelList = [], filteredVocab = [];
  bool isSearchActive = false;
  late Vocab currentVocab;
  String currentArtikel = '';
  int currentTabIndex = 0;
  TextEditingController nounController = TextEditingController();
  TextEditingController translationController = TextEditingController();
  final VocabStorage storage;
  MyListCubit(this.storage) : super(MyListInitial()) {
    loadList();
  }

  void loadList() async {
    emit(MyListLoading());
    vocablist = storage.loadVocabList();
    artikelList = vocablist
        .where((vocab) => vocab.artikel == artikel[currentTabIndex])
        .toList();
    emit(MyListLoaded(vocabList: artikelList));
  }

  void deleteVocab(Vocab vocab) {
    emit(MyListLoading());
    vocablist.remove(vocab);
    artikelList.remove(vocab);
    storage.saveVocabList(vocablist);
    emit(MyListLoaded(vocabList: vocablist));
  }

  void changeTab(int index) {
    emit(MyListLoading());
    currentTabIndex = index;
    artikelList = vocablist
        .where((vocab) => vocab.artikel == artikel[currentTabIndex])
        .toList();
    emit(MyListTabChanged(index: index, vocabList: artikelList));
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredVocab = [];
      emit(MyListInitial());
    } else {
      filteredVocab = vocablist.where((vocab) {
        return vocab.noun.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(MyListSearchLoaded(filteredVocab: filteredVocab));
    }
  }

  void toggleSearch() {
    isSearchActive = !isSearchActive;
    emit(MyListSearchActivate(acivated: isSearchActive));
  }
  // void selectVocab(Vocab vocab) {
  //   emit(MyListLoading());
  //   currentArtikel = vocab.artikel;
  //   emit(MyListEditing(vocab: currentVocab));
  // }

  // void editArtikel(String newArtikel) {
  //   emit(MyListLoading());
  //   currentArtikel = newArtikel;
  //   emit(MyListEditing(vocab: currentVocab));
  // }

  // void changeVocab(Vocab vocab) {
  //   emit(MyListLoading());
  //   currentVocab = vocab;

  //   // Filter the vocab list based on the current tab's artikel
  //   artikelList = vocablist
  //       .where((vocab) => vocab.artikel == artikel[currentTabIndex])
  //       .toList();

  //   emit(MyListEditing(vocab: currentVocab));
  // }
}
