part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  const ThemesEvent();
}

class ChangeThemeEvent extends ThemesEvent {
  final String theme;
  const ChangeThemeEvent({
    required this.theme,
  });

  @override
  List<Object?> get props => [theme];
}
