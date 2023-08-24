part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class PlayMusic extends SettingEvent {
  final bool musicIsOn = true;
  @override
  List<Object> get props => [musicIsOn];
}

class StopMusic extends SettingEvent {
  final bool musicIsOn = false;
  @override
  List<Object> get props => [musicIsOn];
}

class EffectOn extends SettingEvent {
  final bool effectIsOn = true;
  @override
  List<Object> get props => [effectIsOn];
}

class EffectOff extends SettingEvent {
  final bool effectIsOn = false;
  @override
  List<Object> get props => [effectIsOn];
}





class OnThemeSelected extends SettingEvent{
  final int themeSelected;
  const OnThemeSelected({required this.themeSelected});
  
  @override
  List<Object> get props => [themeSelected];
}