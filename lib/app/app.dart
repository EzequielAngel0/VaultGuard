import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/infrastructure/security/app_lifecycle_observer.dart';
import '../router/app_router.dart';
import '../theme/app_theme.dart';
import '../theme/app_transitions.dart';
import 'di/injection.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final AppLifecycleObserver _observer;

  @override
  void initState() {
    super.initState();
    _observer = getIt<AppLifecycleObserver>();
    _observer.initialize();
  }

  @override
  void dispose() {
    _observer.dispose();
    super.dispose();
  }

  void _onUserActivity() => _observer.onUserActivity();

  @override
  Widget build(BuildContext context) {
    final router = ref.read(appRouterProvider);

    return Listener(
      // Reset inactivity timer on any pointer event (tap, scroll, drag).
      onPointerDown: (_) => _onUserActivity(),
      child: MaterialApp.router(
        title: 'SoloKey',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark().copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SlideUpFadeTransition(),
              TargetPlatform.iOS: SlideUpFadeTransition(),
            },
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}
