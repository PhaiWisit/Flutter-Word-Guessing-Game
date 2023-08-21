// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../database/vocab_service.dart';
import '../../models/vocab_model.dart';

part 'vocab_event.dart';
part 'vocab_state.dart';

class VocabBloc extends Bloc<VocabEvent, VocabState> {
  VocabBloc() : super(VocabLoadingState()) {
    on<VocabEvent>((event, emit) {});
    on<GetVocabList>(_onGetVocabList);
    on<GetVocabRandomList>(_onGetVocabRandomList);
  }
  Future<void> _onGetVocabList(
      GetVocabList event, Emitter<VocabState> emit) async {
    VocabService vocabService = VocabService();
    emit(VocabLoadingState());
    try {
      final vocabList =
          await vocabService.getVocabList(level: event.level, quiz: event.quiz);
      emit(VocabLoadedState(vocabList));
    } catch (e) {
      emit(VocabErrorState(e.toString()));
    }
  }

  Future<void> _onGetVocabRandomList(
      GetVocabRandomList event, Emitter<VocabState> emit) async {
    VocabService vocabService = VocabService();
    emit(VocabLoadingState());
    try {
      final vocabList =
          await vocabService.getRandomVocabList();
      emit(VocabLoadedState(vocabList));
    } catch (e) {
      emit(VocabErrorState(e.toString()));
    }
  }
}
