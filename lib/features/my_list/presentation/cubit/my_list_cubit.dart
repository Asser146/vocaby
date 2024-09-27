import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'my_list_state.dart';

class MyListCubit extends Cubit<MyListState> {
  List<Vocab> vocablist = [];
  final VocabStorage storage;
  MyListCubit(this.storage) : super(MyListInitial()) {
    loadList();
  }

  void loadList() async {
    emit(MyListLoading());
    vocablist = storage.loadVocabList();
    emit(MyListLoaded(vocabList: vocablist));
  }

  void deleteVocab(Vocab vocab) {
    emit(MyListLoading());
    vocablist.remove(vocab);
    // storage.deleteVocab(vocab);
    storage.saveVocabList(vocablist);
    emit(MyListLoaded(vocabList: vocablist));
  }
}
