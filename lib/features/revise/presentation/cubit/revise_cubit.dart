import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';
import 'dart:math';

part 'revise_state.dart';

class ReviseCubit extends Cubit<ReviseState> {
  late List<Vocab> vocabList;
  Queue<Vocab> testQueue = Queue<Vocab>();
  final VocabStorage storage;
  bool mode1 = true;
  int correctNumber = 0, falseNumber = 0;
  bool correctToFalse = true;
  List<String>? currentChoices; // Store the current Arabic choices

  ReviseCubit(this.storage) : super(ReviseInitial()) {
    loadList();
  }

  void loadList() async {
    emit(ReviseLoading());
    vocabList = storage.loadVocabList();
    beginTest();
    emit(ReviseLoaded(vocabList: testQueue));
  }

  void changeMode() async {
    emit(ReviseLoading());
    mode1 = !mode1;
    emit(ReviseModeChanged(mode: mode1));
  }

  void beginTest() {
    List<Vocab> temp = vocabList;
    temp.shuffle();
    testQueue.addAll(temp);
    // generateChoices(); // Generate choices for the first question
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

  bool check2(String choice) {
    emit(ReviseLoading());
    if (choice == current.arabicTranslation) {
      correctToFalse = true;
      correctNumber++;
      testQueue.removeFirst();
      generateChoices(); // Generate new choices for the next question

      return true;
    } else {
      if (correctToFalse) {
        correctToFalse = false;
        falseNumber++;
      }

      return false;
    }
  }

  Vocab get current => testQueue.first;

  // This function generates new Arabic choices only when a new question is loaded
  void generateChoices() {
    if (testQueue.isNotEmpty) {
      List<String> choices = [current.arabicTranslation];
      Random random = Random();
      Set<int> usedIndexes = {vocabList.indexOf(current)};

      while (choices.length < 3) {
        int randomIndex = random.nextInt(vocabList.length);
        if (!usedIndexes.contains(randomIndex)) {
          choices.add(vocabList[randomIndex].arabicTranslation);
          usedIndexes.add(randomIndex);
        }
      }

      choices.shuffle();
      currentChoices = choices; // Store the choices for the current question
      emit(ReviseChoicesUpdated(choices: currentChoices!));
    }
  }

  // Now returning the stored choices instead of recalculating every time
  List<String> get arabicChoices => currentChoices ?? [];

  int get currentIndex => vocabList.length - testQueue.length + 1;
}
