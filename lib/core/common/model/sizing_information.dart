import 'dart:ui';

import '../util/device_type.dart';

class SizingInformation {
  final DeviceType deviceType;
  final Size localWidgetSize;
  final Size screenSize;

  const SizingInformation({
    required this.localWidgetSize,
    required this.deviceType,
    required this.screenSize,
  });
}
