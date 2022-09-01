part of 'themes_bloc.dart';

class ThemesState extends Equatable {
  final String? theme;

  const ThemesState({this.theme});

  @override
  List<Object?> get props => [theme];

  factory ThemesState.initial() => const ThemesState(theme: 'light');

  factory ThemesState.copyWith({
    required String newTheme,
  }) {
    return ThemesState(
      theme: newTheme,
    );
  }
}
