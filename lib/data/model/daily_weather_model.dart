import 'package:weather_app/data/model/nextforecast_model.dart';

class DailyWeatherModel {
  final String date;
  final List<WeatherInfo> weatherInfoList;

  DailyWeatherModel({
    required this.date,
    required this.weatherInfoList,
  });

  factory DailyWeatherModel.fromWeatherInfoList(List<WeatherInfo> weatherInfoList) {
    // Assuming weatherInfoList is sorted by date in ascending order.
    // You may need to sort it before creating DailyWeatherModel instances.
    if (weatherInfoList.isEmpty) {
      throw Exception("weatherInfoList is empty");
    }

    final firstWeatherInfo = weatherInfoList.first;
    final date = _getDateFromTimestamp(firstWeatherInfo.dt);

    final dailyInfoList = <WeatherInfo>[];
    final dailyDate = date;

    for (final weatherInfo in weatherInfoList) {
      final currentDate = _getDateFromTimestamp(weatherInfo.dt);

      if (currentDate == dailyDate) {
        dailyInfoList.add(weatherInfo);
      } else {
        break; // Assumes weatherInfoList is sorted by date.
      }
    }

    return DailyWeatherModel(
      date: _formatDate(date),
      weatherInfoList: dailyInfoList,
    );
  }

  static DateTime _getDateFromTimestamp(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
  }

  static String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$year-$month-$day';
  }
}