import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../../core/localization/app_localization.dart';
import '../../../../core/route/app_route.dart';
import '../../../../core/route/route_generator.dart';
import '../../../../injection.dart';
import '../../cubit/application_cubit.dart';

class Application extends StatelessWidget {
  const Application();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ApplicationCubit>(),
      child: BlocBuilder<ApplicationCubit, ApplicationState>(
        builder: (context, state) {
          return buildMaterialApp(state);
        },
      ),
    );
  }

  MaterialApp buildMaterialApp(ApplicationState state) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generate,
      initialRoute: AppRoute.kHomePageRoute,
      supportedLocales: kSupportedLocales,
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Starter',
      locale: state.locale,
      theme: state.theme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (final local in supportedLocales) {
          if (local.languageCode == locale!.languageCode) {
            return local;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
