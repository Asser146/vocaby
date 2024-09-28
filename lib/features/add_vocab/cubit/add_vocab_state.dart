part of 'add_vocab_cubit.dart';

sealed class AddVocabState extends Equatable {
  const AddVocabState();

  @override
  List<Object> get props => [];
}

final class AddVocabInitial extends AddVocabState {
  final String artikel;
  const AddVocabInitial({required this.artikel});
  @override
  List<Object> get props => [artikel];
}

final class AddVocabArtikelChanged extends AddVocabState {
  final String artikel;
  const AddVocabArtikelChanged({required this.artikel});
  @override
  List<Object> get props => [artikel];
}

final class AddVocabNounChanged extends AddVocabState {
  final String noun;
  const AddVocabNounChanged({required this.noun});
  @override
  List<Object> get props => [noun];
}
