part of 'level_bloc.dart';

abstract class LevelState extends Equatable {
  // final List<LevelModel> levelList;

  // const LevelState({
  //   this.levelList = const <LevelModel>[],
  // });

  // @override
  // List<Object> get props => [];
}

class LevelLoadingState extends LevelState {
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
