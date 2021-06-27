import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class DeviceInformation {
  final MediaQueryData _mediaQuery;

  const DeviceInformation(this._mediaQuery);

  DeviceType get deviceType => _getDeviceType();

  DeviceType _getDeviceType() {
    final deviceWidth = _mediaQuery.size.shortestSide;

    if (deviceWidth > 950) {
      return DeviceType.desktop;
    }

    if (deviceWidth > 600) {
      return DeviceType.tablet;
    }

    return DeviceType.mobile;
  }
}
