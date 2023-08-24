import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends HydratedBloc<SettingEvent, SettingState> {
  SettingBloc()
      : super(const SettingInitial(
            themeSelected: 1, musicIsOn: true, effectIsOn: true)) {
    on<SettingEvent>((event, emit) {});
    on<OnThemeSelected>(_onThemeSelected);
    on<PlayMusic>(_onPlayMusic);
    on<StopMusic>(_onStopMusic);
    on<EffectOn>(_onEffectOn);
    on<EffectOff>(_onEffectOff);
  }

  void _onThemeSelected(OnThemeSelected event, Emitter<SettingState> emit) {
    final themeSelected = event.themeSelected;
    emit(SettingState(
        themeSelected: themeSelected,
        musicIsOn: state.musicIsOn,
        effectIsOn: state.effectIsOn));
  }

  // Sound
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<void> _onPlayMusic(PlayMusic event, Emitter<SettingState> emit) async {
    final themeSelected = state.themeSelected;
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('sounds/music.mp3'));
    emit(SettingState(
        themeSelected: themeSelected,
        musicIsOn: event.musicIsOn,
        effectIsOn: state.effectIsOn));
  }

  Future<void> _onStopMusic(StopMusic event, Emitter<SettingState> emit) async {
    await _audioPlayer.stop();
    final themeSelected = state.themeSelected;
    emit(SettingState(
      themeSelected: themeSelected,
      musicIsOn: event.musicIsOn,
      effectIsOn: state.effectIsOn,
    ));
  }

  void _onEffectOn(EffectOn event, Emitter<SettingState> emit) {
    emit(SettingState(
      themeSelected: state.themeSelected,
      musicIsOn: state.musicIsOn,
      effectIsOn: event.effectIsOn,
    ));
  }
  void _onEffectOff(EffectOff event, Emitter<SettingState> emit) {
    emit(SettingState(
      themeSelected: state.themeSelected,
      musicIsOn: state.musicIsOn,
      effectIsOn: event.effectIsOn,
    ));
  }

  @override
  SettingState? fromJson(Map<String, dynamic> json) {
    return SettingState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingState state) {
    return state.toMap();
  }
}
