import 'package:flutter/material.dart';

class ResponsiveOrientationBuilder extends StatelessWidget {
  final Widget? landscape;
  final Widget portrait;

  const ResponsiveOrientationBuilder({required this.portrait, this.landscape});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape && landscape != null) {
          return landscape!;
        }

        return portrait;
      },
    );
  }
}
