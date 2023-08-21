part of 'app_bloc_bloc.dart';

abstract class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object> get props => [];
}

class ChooseLevel extends AppBlocEvent{
  final int level;
  const ChooseLevel({required this.level});
  
  @override
  List<Object> get props => [level];
}

class ChooseQuiz extends AppBlocEvent{
  final int quiz;
  const ChooseQuiz({required this.quiz});
  
  @override
  List<Object> get props => [quiz];
}

