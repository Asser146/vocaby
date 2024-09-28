import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vocaby/features/my_list/data/vocab.dart';
import 'package:vocaby/features/my_list/domain/vocab_storage.dart';

part 'revise_state.dart';

class ReviseCubit extends Cubit<ReviseState> {
  late List<Vocab> vocabList;
  final VocabStorage storage;

  ReviseCubit(this.storage) : super(ReviseInitial()) {
    loadList();
  }

  void loadList() async {
    emit(ReviseLoading());
    vocabList = storage.loadVocabList();
    emit(ReviseLoaded(vocabList: vocabList));
  }
}
