part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuizList extends QuizEvent {
  final int level;

  const GetQuizList(this.level);

  @override
  List<Object> get props => [];
}
