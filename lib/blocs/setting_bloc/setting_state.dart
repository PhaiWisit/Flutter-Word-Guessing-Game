part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final int themeSelected;
  final bool musicIsOn;
  final bool effectIsOn;
  const SettingState(
      {required this.themeSelected,
      required this.musicIsOn,
      required this.effectIsOn});

  @override
  List<Object> get props => [
        themeSelected,
        musicIsOn,
        effectIsOn,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeSelected': themeSelected,
      'musicIsOn': musicIsOn,
      'effectIsOn': effectIsOn,
    };
  }

  factory SettingState.fromMap(Map<String, dynamic> map) {
    return SettingState(
      themeSelected: map['themeSelected'] as int,
      musicIsOn: map['musicIsOn'] as bool,
      effectIsOn: map['effectIsOn'] as bool,
    );
  }
}

class SettingInitial extends SettingState {
  const SettingInitial({required int themeSelected, required bool musicIsOn, required bool effectIsOn})
      : super(themeSelected: themeSelected, musicIsOn: musicIsOn, effectIsOn: effectIsOn);
}
