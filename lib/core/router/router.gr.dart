// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:weather_app/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:weather_app/features/map_data/view/map_data_page.dart'
    deferred as _i2;
import 'package:weather_app/features/next_daily_forecast/view/next_daily_forecast_page.dart'
    deferred as _i3;
import 'package:weather_app/features/weather/view/weather_page.dart'
    deferred as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.CounterPage(),
        ),
      );
    },
    MapDataRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.MapDataPage(),
        ),
      );
    },
    NextDailyForecastRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.NextDailyForecastPage(),
        ),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.WeatherPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i5.PageRouteInfo<void> {
  const CounterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MapDataPage]
class MapDataRoute extends _i5.PageRouteInfo<void> {
  const MapDataRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MapDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapDataRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NextDailyForecastPage]
class NextDailyForecastRoute extends _i5.PageRouteInfo<void> {
  const NextDailyForecastRoute({List<_i5.PageRouteInfo>? children})
      : super(
          NextDailyForecastRoute.name,
          initialChildren: children,
        );

  static const String name = 'NextDailyForecastRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WeatherPage]
class WeatherRoute extends _i5.PageRouteInfo<void> {
  const WeatherRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
