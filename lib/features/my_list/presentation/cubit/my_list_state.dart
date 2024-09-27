part of 'my_list_cubit.dart';

sealed class MyListState extends Equatable {
  const MyListState();

  @override
  List<Object> get props => [];
}

final class MyListInitial extends MyListState {}

final class MyListLoading extends MyListState {}

final class MyListLoaded extends MyListState {
  final List<Vocab> vocabList;
  const MyListLoaded({required this.vocabList});

  @override
  List<Object> get props => [vocabList];
}
