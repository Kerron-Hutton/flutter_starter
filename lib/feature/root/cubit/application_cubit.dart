import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../core/theme/app_theme_data.dart';

part 'application_state.dart';

@lazySingleton
class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit(ApplicationState state) : super(state);

  void setAppLocal(Locale locale) => emit(state.copyWith(locale: locale));

  void setAppTheme(AppTheme theme) => emit(state.copyWith(theme: theme));
}
