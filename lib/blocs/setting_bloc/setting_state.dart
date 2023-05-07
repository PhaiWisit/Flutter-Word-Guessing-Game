part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final int themeSelected;
  const SettingState({required this.themeSelected});


  @override
  List<Object> get props => [themeSelected];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'themeSelected': themeSelected,
      
    };
  }

  factory SettingState.fromMap(Map<String, dynamic> map) {
    return SettingState(
      themeSelected: map['themeSelected'] as int,
      
    );
  }
}

class SettingInitial extends SettingState {
  const SettingInitial({required int themeSelected}) : super(themeSelected: themeSelected);
}

