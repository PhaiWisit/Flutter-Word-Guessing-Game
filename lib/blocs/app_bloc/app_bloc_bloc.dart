import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBlocBloc extends HydratedBloc<AppBlocEvent, AppBlocState> {
  AppBlocBloc() : super( const AppBlocState(switchTheme: false)) {
    // on<AppBlocEvent>((event, emit) {});
    on<ChooseQuizLevel>(_onChooseQuizLevel);
    on<SwitchThemeApp>(_onSwitchTheme);
  }
  
  @override
  AppBlocState? fromJson(Map<String, dynamic> json) {
    return AppBlocState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(AppBlocState state) {
    return state.toMap();
  }

  void _onChooseQuizLevel(ChooseQuizLevel event, Emitter<AppBlocState> emit) {
  final quizLevel = event.quizLevel;
  final state = this.state;
  emit(AppBlocState(quizLevel: quizLevel,switchTheme: state.switchTheme));
}

void _onSwitchTheme(SwitchThemeApp event, Emitter<AppBlocState> emit){
  final switchTheme = event.switchTheme;
  emit(AppBlocState(switchTheme: switchTheme));
  log('$switchTheme');
}
}

