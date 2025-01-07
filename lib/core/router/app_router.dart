import 'package:auto_route/auto_route.dart';

import '../../features/analytics/presentation/pages/analytics_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/chat/presentation/pages/chat_rooms_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: ProfileRoute.page, path: '/profile'),
    AutoRoute(page: AnalyticsRoute.page, path: '/analytics'),
    AutoRoute(page: ChatRoomsRoute.page, path: '/chat-rooms'),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
