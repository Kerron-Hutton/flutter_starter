import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/responsive/reponsive_page_builder.dart';
import '../../../../core/responsive/responsive_orientation_builder.dart';
import '../../../../injection.dart';
import '../../cubit/counter_cubit.dart';
import 'mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (_) => getIt<CounterCubit>(),
      child: const ResponsivePageBuilder(
        mobile: ResponsiveOrientationBuilder(
          portrait: MobileHomePage(),
        ),
      ),
    );
  }
}
