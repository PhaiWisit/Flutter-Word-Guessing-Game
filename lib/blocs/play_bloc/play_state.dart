part of 'play_bloc.dart';

class PlayState extends Equatable {
  final int wordIndex;
  final int correctNumber;

  const PlayState({
    this.wordIndex = 0,
    this.correctNumber = 0,
  });

  @override
  List<Object> get props => [wordIndex,correctNumber];
}

class PlayInitial extends PlayState {}
