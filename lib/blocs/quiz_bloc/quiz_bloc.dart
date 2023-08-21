// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../database/quiz_service.dart';
import '../../models/quiz_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizLoadingState()) {
    on<QuizEvent>((event, emit) {});
    on<GetQuizList>(_onGetQuizList);
  }

  Future<void> _onGetQuizList(GetQuizList event, Emitter<QuizState> emit) async {
    QuizService quizService = QuizService();
    emit(QuizLoadingState());
      try {
        final quizList = await quizService.getQuizList(level:event.level);
        emit(QuizLoadedState(quizList));
      } catch (e) {
        emit(QuizErrorState(e.toString()));
      }
  }
}
