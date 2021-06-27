import 'package:flutter/material.dart';

import '../common/util/device_type.dart';
import 'responsive_builder.dart';

class ResponsivePageBuilder extends StatelessWidget {
  final Widget? tablet, desktop;
  final Widget mobile;

  const ResponsivePageBuilder({
    required this.mobile,
    this.desktop,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (sizing, context) {
        if (sizing.deviceType == DeviceType.desktop && desktop != null) {
          return desktop!;
        }

        if (sizing.deviceType == DeviceType.tablet && tablet != null) {
          return tablet!;
        }

        return mobile;
      },
    );
  }
}
