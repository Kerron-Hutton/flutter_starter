import 'package:flutter/material.dart';

import '../../feature/home/presentation/pages/home_page.dart';
import 'app_route.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.kHomePageRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Route Error'),
          ),
          body: const Center(
            child: Text(
              'Error occurred on route generation',
            ),
          ),
        );
      },
    );
  }
}
