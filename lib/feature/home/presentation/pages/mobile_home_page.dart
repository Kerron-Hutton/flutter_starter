import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localization.dart';
import '../../../../core/theme/app_theme_data.dart';
import '../../../root/cubit/application_cubit.dart';
import '../../cubit/counter_cubit.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage();

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 20), () {
      context.read<ApplicationCubit>().setAppLocal(const Locale('es', 'ES'));
      context.read<ApplicationCubit>().setAppTheme(AppTheme.dark);
    });

    return Scaffold(
      floatingActionButton: _buildFloatingActionButtons(context),
      appBar: AppBar(
        title: const Text('Flutter Starter'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildFloatingActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().increment(),
          tooltip:
              AppLocalizations.translate(context, 'home.tooltip.increment'),
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().decrement(),
          tooltip:
              AppLocalizations.translate(context, 'home.tooltip.decrement'),
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.translate(context, 'home.counter.message'),
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text('$state', style: Theme.of(context).textTheme.displaySmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
