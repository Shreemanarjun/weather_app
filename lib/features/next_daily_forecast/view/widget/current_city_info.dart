import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';

class CurrentCityInfo extends StatefulWidget {
  final Weather weather;
  final City city;
  const CurrentCityInfo({Key? key, required this.city, required this.weather})
      : super(key: key);

  @override
  State<CurrentCityInfo> createState() => _CurrentCityInfoState();
}

class _CurrentCityInfoState extends State<CurrentCityInfo> {
  String formatTime(int milliseconds) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      milliseconds * 1000,
    );
    return DateFormat("hh:mm a").format(dateTime);
  }

  String getSunrise() {
    return formatTime(widget.city.sunrise);
  }

  String getSunset() {
    return formatTime(widget.city.sunset);
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      CachedNetworkImage(
        imageUrl:
            "https://openweathermap.org/img/wn/${widget.weather.icon}@4x.png",
      ),
      "${widget.city.name},${widget.city.country}".text.xl2.bold.makeCentered(),
      <Widget>[
        "Sunrise : ${getSunrise()}".text.semiBold.make(),
        "Sunset : ${getSunset()}".text.semiBold.make()
      ]
          .hStack(
            alignment: MainAxisAlignment.spaceAround,
          )
          .py16(),
    ].vStack();
  }
}
