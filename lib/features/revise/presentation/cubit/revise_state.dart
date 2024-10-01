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

final class ReviseModeChanged extends ReviseState {
  final bool mode;
  const ReviseModeChanged({required this.mode});

  @override
  List<Object> get props => [mode];
}

final class ReviseChoicesUpdated extends ReviseState {
  final List<String> choices;
  const ReviseChoicesUpdated({required this.choices});

  @override
  List<Object> get props => [choices];
}
