import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/router/router.gr.dart';

@RoutePage(
  deferredLoading: true,
)
class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
        routes: const [
          NextDailyForecastRoute(),
          MapDataRoute(),
        ],
        builder: (context, child, controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Weather"),
              leading: const AutoLeadingButton(),
              bottom: TabBar(
                controller: controller,
                tabs: const [
                  Tab(
                      text: 'Daily forecast for next 5 days',
                      icon: Icon(
                        Icons.event_available,
                      )),
                  Tab(
                      text: 'Precipitation and temperature',
                      icon: Icon(
                        Icons.map_sharp,
                      )),
                ],
              ),
            ),
            body: child,
          );
        });
  }
}
