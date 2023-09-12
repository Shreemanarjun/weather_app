import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/features/next_daily_forecast/controller/next_forecaster_pod.dart';
import 'package:weather_app/features/next_daily_forecast/state/next_forecast_state.dart';
import 'package:weather_app/features/next_daily_forecast/view/widget/current_city_info.dart';
import 'package:weather_app/features/next_daily_forecast/view/widget/next_forecast_list.dart';
import 'package:weather_app/shared/riverpod_ext/asynvalue_easy_when.dart';

@RoutePage(
  deferredLoading: true,
)
class NextDailyForecastPage extends ConsumerWidget {
  const NextDailyForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextforecastAsync = ref.watch(nextForeCastPod);
    return nextforecastAsync.easyWhen(
      data: (nextforecaststate) {
        return switch (nextforecaststate) {
          GettingLocation() => <Widget>[
              const CircularProgressIndicator(),
              "Getting your location".text.bold.make(),
            ].vStack(
              alignment: MainAxisAlignment.center,
            ),
          LocationError(:final error) => [
              "Failed to get your location due to $error".text.makeCentered(),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(nextForeCastPod);
                },
                child: "Retry".text.make(),
              ).p8()
            ].vStack(
              alignment: MainAxisAlignment.center,
            ),
          GettingForeCastData() => <Widget>[
              const CircularProgressIndicator(),
              "Getting Forecast data".text.bold.make().p4(),
            ].vStack(
              alignment: MainAxisAlignment.center,
            ),
          ForeCastData(:final nextForeCastModel) => [
              CurrentCityInfo(
                city: nextForeCastModel.city,
                weather: nextForeCastModel.list.first.weather.first,
              ),
              NextForecastList(nextForeCastModel: nextForeCastModel).expand(),
            ].vStack(),
          ForeCastError() => "Failed to get forecast data".text.makeCentered(),
        };
      },
      errorWidget: (error, stackTrace) =>
          "Failed to get forecast data due to $error".text.makeCentered(),
    );
  }
}
