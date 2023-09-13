// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:weather_app/features/api_key/view/api_key_page.dart'
    deferred as _i1;
import 'package:weather_app/features/counter/view/counter_page.dart'
    deferred as _i2;
import 'package:weather_app/features/map_data/view/map_data_page.dart'
    deferred as _i3;
import 'package:weather_app/features/next_daily_forecast/view/next_daily_forecast_page.dart'
    deferred as _i4;
import 'package:weather_app/features/weather/view/weather_page.dart'
    deferred as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ApiKeyRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ApiKeyPage(),
        ),
      );
    },
    CounterRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.CounterPage(),
        ),
      );
    },
    MapDataRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.MapDataPage(),
        ),
      );
    },
    NextDailyForecastRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.NextDailyForecastPage(),
        ),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.WeatherPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ApiKeyPage]
class ApiKeyRoute extends _i6.PageRouteInfo<void> {
  const ApiKeyRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ApiKeyRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiKeyRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MapDataPage]
class MapDataRoute extends _i6.PageRouteInfo<void> {
  const MapDataRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MapDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapDataRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NextDailyForecastPage]
class NextDailyForecastRoute extends _i6.PageRouteInfo<void> {
  const NextDailyForecastRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NextDailyForecastRoute.name,
          initialChildren: children,
        );

  static const String name = 'NextDailyForecastRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.WeatherPage]
class WeatherRoute extends _i6.PageRouteInfo<void> {
  const WeatherRoute({List<_i6.PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
