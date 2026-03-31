import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/di/injection.dart';
import 'app/di/provider_overrides.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    ProviderScope(
      overrides: buildProviderOverrides(),
      child: const App(),
    ),
  );
}
