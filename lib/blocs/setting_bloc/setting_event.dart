part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class OnThemeSelected extends SettingEvent{
  final int themeSelected;
  const OnThemeSelected({required this.themeSelected});
  
  @override
  List<Object> get props => [themeSelected];
}