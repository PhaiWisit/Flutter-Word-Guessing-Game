part of 'app_bloc_bloc.dart';

abstract class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object> get props => [];
}

class ChooseQuizLevel extends AppBlocEvent{
  final int quizLevel;
  const ChooseQuizLevel({required this.quizLevel});
  
  @override
  List<Object> get props => [quizLevel];
}

class SwitchThemeApp extends AppBlocEvent{
  final bool switchTheme;
  const SwitchThemeApp({required this.switchTheme});

  @override
  List<Object> get props => [switchTheme];

}
