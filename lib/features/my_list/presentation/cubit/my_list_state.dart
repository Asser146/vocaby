part of 'my_list_cubit.dart';

sealed class MyListState extends Equatable {
  const MyListState();

  @override
  List<Object> get props => [];
}

final class MyListInitial extends MyListState {}

final class MyListLoading extends MyListState {}

final class MyListTabChanged extends MyListState {
  final int index;
  const MyListTabChanged({required this.index});

  @override
  List<Object> get props => [index];
}

final class MyListLoaded extends MyListState {
  final List<Vocab> vocabList;
  const MyListLoaded({required this.vocabList});

  @override
  List<Object> get props => [vocabList];
}

final class MyListEditing extends MyListState {
  final Vocab vocab;
  const MyListEditing({required this.vocab});

  @override
  List<Object> get props => [vocab];
}
