import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

class AppBlocBloc extends HydratedBloc<AppBlocEvent, AppBlocState> {
  AppBlocBloc() : super(const AppBlocState(quizLevel: 0)) {
    on<AppBlocEvent>((event, emit) {});
    on<ChooseQuizLevel>(_onChooseQuizLevel);
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
    emit(AppBlocState(quizLevel: quizLevel));
  }
}
