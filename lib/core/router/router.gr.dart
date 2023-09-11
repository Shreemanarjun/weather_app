// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:weather_app/features/counter/view/counter_page.dart'
    deferred as _i1;
import 'package:weather_app/features/weather/view/weather_page.dart'
    deferred as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.CounterPage(),
        ),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DeferredWidget(
          _i2.loadLibrary,
          () => _i2.WeatherPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i3.PageRouteInfo<void> {
  const CounterRoute({List<_i3.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WeatherPage]
class WeatherRoute extends _i3.PageRouteInfo<void> {
  const WeatherRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
