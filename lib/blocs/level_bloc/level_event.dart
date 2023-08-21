part of 'level_bloc.dart';

abstract class LevelEvent extends Equatable {
  const LevelEvent();

  @override
  List<Object> get props => [];
}

class GetLevelList extends LevelEvent {
  @override
  List<Object> get props => [];
}

// class ChooseLevel extends LevelEvent{
//   final int level;
//   const ChooseLevel({required this.level});
  
//   @override
//   List<Object> get props => [level];
// }

