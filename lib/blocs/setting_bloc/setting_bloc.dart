import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends HydratedBloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingInitial(themeSelected: 1)) {
    on<SettingEvent>((event, emit) {});
    on<OnThemeSelected>(_onThemeSelected);
  }

  void _onThemeSelected(OnThemeSelected event, Emitter<SettingState> emit) {
    final themeSelected = event.themeSelected;
    emit(SettingState(themeSelected: themeSelected));
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
