import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:weather_app/data/model/nextforecast_model.dart';

class WeatherTile extends StatelessWidget {
  final WeatherInfo weatherInfo;
  const WeatherTile({
    Key? key,
    required this.weatherInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
        ),
      ),
      child: <Widget>[
        "${weatherInfo.main.temp.toInt()} \u00B0C"
            .text
            .extraBold
            .xl
            .make()
            .py4()
            .flexible(),
        CachedNetworkImage(
          imageUrl:
              "https://openweathermap.org/img/wn/${weatherInfo.weather.first.icon}@2x.png",
          errorWidget: (context, url, error) => const SizedBox.shrink(),
        ).flexible(flex: 2),
        "Feels ${weatherInfo.main.feelsLike.toInt()}  \u00B0C"
            .text
            .make()
            .py4()
            .flexible(),
        <Widget>[
          const Icon(Icons.air),
          "${weatherInfo.wind.speed}   m/s".text.semiBold.make().py4(),
        ]
            .hStack(
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            )
            .flexible(),
        const Spacer(),
        DateFormat("hh:MM a")
            .format(weatherInfo.dtTxt)
            .toString()
            .text
            .xl
            .bold
            .make()
            .py4()
            .objectBottomCenter()
            .flexible()
      ].vStack().py8(),
    );
  }
}
