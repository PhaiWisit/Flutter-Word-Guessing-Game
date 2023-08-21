part of 'level_bloc.dart';

abstract class LevelState extends Equatable {

}

class LevelLoadingState extends LevelState {
  LevelLoadingState();

  @override
  List<Object?> get props => [];
}

class LevelLoadedState extends LevelState {
  final List<LevelModel> levelList;
  
  LevelLoadedState(this.levelList);
  @override
  List<Object?> get props => [levelList];
}

class LevelErrorState extends LevelState {
  final String error;
  LevelErrorState(this.error);
  @override
  List<Object?> get props => [error];
}




// class LevelInitial extends LevelState {
  

// }
