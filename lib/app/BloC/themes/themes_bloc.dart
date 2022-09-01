import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends HydratedBloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(ThemesState.initial()) {
    on<ChangeThemeEvent>(changeTheme);
  }

  void changeTheme(
    ChangeThemeEvent event,
    Emitter<ThemesState> emit,
  ) {
    String? theme = state.theme;
    theme ??= event.theme;

    theme = theme == 'light' ? 'dark' : 'light';

    emit(ThemesState.copyWith(newTheme: theme));
  }

  @override
  ThemesState? fromJson(Map<String, dynamic> json) {
    return ThemesState.copyWith(newTheme: json['theme'] ?? 'light');
  }

  @override
  Map<String, dynamic>? toJson(ThemesState state) {
    return {'theme': state.theme ?? 'light'};
  }
}
