import 'package:auto_route/auto_route.dart';
import 'package:weather_app/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: ApiKeyRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: WeatherRoute.page,
      path: '/weather',
      children: [
        AutoRoute(
          page: NextDailyForecastRoute.page,
          path: 'nextForeCast',
        ),
        AutoRoute(
          page: MapDataRoute.page,
          path: 'nextForeCast',
        ),
      ],
    ),
  ];
}
