import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/theme/app_theme_data.dart';
import 'feature/root/cubit/application_cubit.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureInjector(String env) async {
  final gh = GetItHelper(getIt, env);

  gh.lazySingleton<ApplicationState>(
    () => const ApplicationState(
      locale: Locale('en', 'US'),
      theme: AppTheme.light,
    ),
  );

  return $initGetIt(getIt, environment: env);
}
