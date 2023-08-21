// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:word_test/database/level_service.dart';
import 'package:word_test/models/level_model.dart';
part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  LevelBloc() : super(LevelLoadingState()) {
    on<LevelEvent>((event, emit) {});
    on<GetLevelList>(_onGetLevelList);
    
  }

  // void _onChooseLevel(ChooseLevel event, Emitter<LevelState> emit) {
  //   emit(LevelLoadingState());
  // }

  Future<void> _onGetLevelList(GetLevelList event, Emitter<LevelState> emit) async {
    LevelService levelService = LevelService();
    emit(LevelLoadingState());
      try {
        final levelList = await levelService.getLevelList();
        emit(LevelLoadedState(levelList));
      } catch (e) {
        emit(LevelErrorState(e.toString()));
      }
  }
}
