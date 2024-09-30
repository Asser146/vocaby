import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'revise_state.dart';

class ReviseCubit extends Cubit<ReviseState> {
  late List<Vocab> vocabList;
  Queue<Vocab> testQueue = Queue<Vocab>();
  final VocabStorage storage;
  int correctNumber = 0, falseNumber = 0;
  bool correctToFalse = true;
  ReviseCubit(this.storage) : super(ReviseInitial()) {
    loadList();
  }

  void loadList() async {
    emit(ReviseLoading());
    vocabList = storage.loadVocabList();
    beginTest();
    emit(ReviseLoaded(vocabList: testQueue));
  }

  void beginTest() {
    List<Vocab> temp = vocabList;
    temp.shuffle();
    testQueue.addAll(temp);
  }

  bool check(String artikel) {
    emit(ReviseLoading());
    if (artikel == current.artikel) {
      correctToFalse = true;
      correctNumber++;
      testQueue.removeFirst();
      emit(ReviseLoaded(vocabList: testQueue));
      return true;
    } else {
      if (correctToFalse) {
        correctToFalse = false;
        falseNumber++;
      }
      emit(ReviseLoaded(vocabList: testQueue));
      return false;
    }
  }

  Vocab get current => testQueue.first;

  int get currentIndex => vocabList.length - testQueue.length + 1;
}
