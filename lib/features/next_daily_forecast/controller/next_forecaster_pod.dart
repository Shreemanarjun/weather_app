import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/next_daily_forecast/controller/notifier/next_forecast_notifier.dart';
import 'package:weather_app/features/next_daily_forecast/state/next_forecast_state.dart';

final nextForeCastPod =
    AsyncNotifierProvider.autoDispose<NextForeCastNotifier, NextForeCastState>(
        NextForeCastNotifier.new);
