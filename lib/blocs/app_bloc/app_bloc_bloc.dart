import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBlocBloc extends HydratedBloc<AppBlocEvent, AppBlocState> {
  AppBlocBloc() : super(const AppBlocState()) {
    on<AppBlocEvent>((event, emit) {});
    on<ChooseLevel>(_onChooseLevel);
    on<ChooseQuiz>(_onChooseQuiz);
  }

  @override
  AppBlocState? fromJson(Map<String, dynamic> json) {
    return AppBlocState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AppBlocState state) {
    return state.toMap();
  }

  void _onChooseLevel(ChooseLevel event, Emitter<AppBlocState> emit) {
    final level = event.level;
    final state = this.state;
    emit(AppBlocState(level: level, quiz: state.quiz));
  }
  void _onChooseQuiz(ChooseQuiz event, Emitter<AppBlocState> emit) {
    final quiz = event.quiz;
    final state = this.state;
    log(quiz.toString());
    emit(AppBlocState(level: state.level, quiz: quiz));
  }
}
