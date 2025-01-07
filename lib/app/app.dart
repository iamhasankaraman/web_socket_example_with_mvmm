import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_example_with_mvmm/data/repositories/websocket_repository_impl.dart';

import '../core/di/locator.dart';
// ignore: unused_import
import '../core/router/app_router.dart';
import '../features/settings/presentation/providers/settings_provider.dart';
import '../features/auth/presentation/providers/auth_provider.dart';
import 'theme/theme_provider.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => getIt<WebSocketRepositoryImpl>()),
        ChangeNotifierProvider(create: (_) => getIt<ThemeProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<SettingsProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }
}
