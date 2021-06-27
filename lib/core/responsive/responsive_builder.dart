import 'package:flutter/material.dart';
import '../common/model/sizing_information.dart';
import '../common/util/device_type.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
  SizingInformation sizing,
  BuildContext context,
);

class ResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveBuilder({required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);

        final deviceInfo = DeviceInformation(mediaQuery);

        final sizing = SizingInformation(
          deviceType: deviceInfo.deviceType,
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            constraints.maxWidth,
            constraints.maxHeight,
          ),
        );

        return builder(sizing, context);
      },
    );
  }
}
