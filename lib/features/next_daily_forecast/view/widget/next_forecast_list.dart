import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app/data/model/daily_weather_model.dart';
import 'package:weather_app/data/model/nextforecast_model.dart';
import 'package:weather_app/features/next_daily_forecast/view/widget/date_header.dart';
import 'package:weather_app/features/next_daily_forecast/view/widget/weather_tile.dart';

class NextForecastList extends StatefulWidget {
  final NextForeCastModel nextForeCastModel;
  const NextForecastList({Key? key, required this.nextForeCastModel})
      : super(key: key);

  @override
  State<NextForecastList> createState() => _NextForecastListState();
}

class _NextForecastListState extends State<NextForecastList> {
  List<DailyWeatherModel> groupWeatherInfoByDate(
      List<WeatherInfo> weatherInfoList) {
    final groupedWeather = <DailyWeatherModel>[];
    final groupedMap = <String, List<WeatherInfo>>{};

    // Sort the weatherInfoList by timestamp in ascending order
    weatherInfoList.sort((a, b) => a.dt.compareTo(b.dt));

    for (final weatherInfo in weatherInfoList) {
      final date = _formatDate(_getDateFromTimestamp(weatherInfo.dt));

      if (!groupedMap.containsKey(date)) {
        groupedMap[date] = [weatherInfo];
      } else {
        groupedMap[date]!.add(weatherInfo);
      }
    }

    groupedMap.forEach((date, weatherList) {
      groupedWeather
          .add(DailyWeatherModel(date: date, weatherInfoList: weatherList));
    });

    return groupedWeather;
  }

  DateTime _getDateFromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$year-$month-$day';
  }

  DateTime getDatefromString(final String date) {
    return DateFormat("yyyy-MM-dd").parse(date);
  }

  final pagecontroller = PageController();
  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  int pageIndex = 0;

  void onBack() {
    pagecontroller.jumpToPage(pageIndex - 1);
  }

  void onNext() {
    pagecontroller.jumpToPage(pageIndex + 1);
  }

  List<DailyWeatherModel> getWeatherInfo() {
    return groupWeatherInfoByDate(widget.nextForeCastModel.list);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pagecontroller,
      itemCount: getWeatherInfo().length,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      padEnds: false,
      onPageChanged: (value) {
        pageIndex = value;
      },
      itemBuilder: (context, index) {
        final dailyweatherModel = getWeatherInfo()[index];
        return <Widget>[
          DateHeader(
            pageIndex: pageIndex,
            date: DateFormat("dd MMM yyyy")
                .format(getDatefromString(dailyweatherModel.date)),
            onBackPressed: onBack,
            onNextPressed: onNext,
            maxPage: getWeatherInfo().length,
          ),
          ListView.separated(
            itemCount: dailyweatherModel.weatherInfoList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => 12.widthBox,
            itemBuilder: (context, index) {
              final weatherInfo = dailyweatherModel.weatherInfoList[index];
              return WeatherTile(weatherInfo: weatherInfo);
            },
          ).h(200).p8().flexible(),
        ].vStack(
          axisSize: MainAxisSize.min,
        );
      },
    ).p8();
  }
}
