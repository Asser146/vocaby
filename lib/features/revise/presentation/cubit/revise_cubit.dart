import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'revise_state.dart';

class ReviseCubit extends Cubit<ReviseState> {
  late List<Vocab> vocabList;
  List<Vocab> testList = [];
  final VocabStorage storage;

  ReviseCubit(this.storage) : super(ReviseInitial()) {
    loadList();
  }

  void loadList() async {
    emit(ReviseLoading());
    vocabList = storage.loadVocabList();
    beginTest();
    emit(ReviseLoaded(vocabList: testList));
  }

  void beginTest() {
    testList = vocabList;
    testList.shuffle();
  }

  bool check(String artikel) {
    if (artikel == current.artikel) {
      emit(ReviseLoading());
      getNext();
      emit(ReviseLoaded(vocabList: testList));
      return true;
    } else {
      return false;
    }
  }

  Vocab get current {
    return testList[testList.length - 1];
  }

  void getNext() => testList.removeLast();
}
