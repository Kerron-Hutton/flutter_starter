import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'feature/root/presentation/widget/application.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjector(Environment.dev);

  runApp(
    DevicePreview(
      builder: (_) => const Application(),
      enabled: !kReleaseMode,
    ),
  );
}
