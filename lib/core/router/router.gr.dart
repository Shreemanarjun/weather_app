// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:weather_app/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:weather_app/features/next_daily_forecast/view/next_daily_forecast_page.dart'
    deferred as _i2;
import 'package:weather_app/features/weather/view/weather_page.dart'
    deferred as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.CounterPage(),
        ),
      );
    },
    NextDailyForecastRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.NextDailyForecastPage(),
        ),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.WeatherPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i4.PageRouteInfo<void> {
  const CounterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.NextDailyForecastPage]
class NextDailyForecastRoute extends _i4.PageRouteInfo<void> {
  const NextDailyForecastRoute({List<_i4.PageRouteInfo>? children})
      : super(
          NextDailyForecastRoute.name,
          initialChildren: children,
        );

  static const String name = 'NextDailyForecastRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WeatherPage]
class WeatherRoute extends _i4.PageRouteInfo<void> {
  const WeatherRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
