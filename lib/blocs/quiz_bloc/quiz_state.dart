part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  
  // const QuizState();
  
  // @override
  // List<Object> get props => [];
}

class QuizLoadingState extends QuizState {
  QuizLoadingState();

  @override
  List<Object?> get props => [];
}

class QuizLoadedState extends QuizState {
  final List<QuizModel> quizList;
  
  QuizLoadedState(this.quizList) ;
  @override
  List<Object?> get props => [quizList];
}

class QuizErrorState extends QuizState {
  final String error;
  QuizErrorState(this.error) ;
  @override
  List<Object?> get props => [error];
}

// class QuizInitial extends QuizState {}
