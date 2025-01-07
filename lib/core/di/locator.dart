import 'package:get_it/get_it.dart';

import '../../data/repositories/websocket_repository_impl.dart';
import '../../features/analytics/presentation/providers/analytics_provider.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/chat/presentation/providers/chat_rooms_provider.dart';
import '../../features/home/presentation/providers/home_provider.dart';
import '../../features/settings/presentation/providers/settings_provider.dart';
import '../../app/theme/theme_provider.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Repositories
  getIt.registerLazySingleton(() => WebSocketRepositoryImpl());

  // Providers
  getIt.registerLazySingleton(() => ThemeProvider());
  getIt.registerLazySingleton(() => SettingsProvider());
  getIt.registerLazySingleton(() => AuthProvider());
  getIt.registerLazySingleton(
    () => HomeProvider(websocketRepository: getIt()),
  );
  getIt.registerLazySingleton(
    () => AnalyticsProvider(websocketRepository: getIt()),
  );
  getIt.registerLazySingleton(() => ChatRoomsProvider());
}
