part of 'application_cubit.dart';

class ApplicationState extends Equatable {
  final ThemeData theme;
  final Locale locale;

  const ApplicationState({required this.locale, required this.theme});

  ApplicationState copyWith({ThemeData? theme, Locale? locale}) {
    return ApplicationState(
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [theme, locale];
}
