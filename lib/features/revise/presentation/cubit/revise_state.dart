part of 'revise_cubit.dart';

sealed class ReviseState extends Equatable {
  const ReviseState();

  @override
  List<Object> get props => [];
}

final class ReviseInitial extends ReviseState {}

final class ReviseLoading extends ReviseState {}

final class ReviseLoaded extends ReviseState {
  final Queue<Vocab> vocabList;
  const ReviseLoaded({required this.vocabList});

  @override
  List<Object> get props => [vocabList];
}
