import 'dart:convert';

import 'package:flutter/foundation.dart';

class NextForeCastModel {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherInfo> list;
  final City city;

  NextForeCastModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory NextForeCastModel.fromJson(String str) =>
      NextForeCastModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NextForeCastModel.fromMap(Map<String, dynamic> json) =>
      NextForeCastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<WeatherInfo>.from(
            json["list"].map((x) => WeatherInfo.fromMap(x))),
        city: City.fromMap(json["city"]),
      );

  Map<String, dynamic> toMap() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
        "city": city.toMap(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NextForeCastModel &&
        other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }

  @override
  String toString() {
    return 'NextForeCastModel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromMap(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "coord": coord.toMap(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.name == name &&
        other.coord == coord &&
        other.country == country &&
        other.population == population &&
        other.timezone == timezone &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coord.hashCode ^
        country.hashCode ^
        population.hashCode ^
        timezone.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }

  @override
  String toString() {
    return 'City(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }
}

class Coord {
  final double lat;
  final double lon;

  Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coord && other.lat == lat && other.lon == lon;
  }

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;

  @override
  String toString() => 'Coord(lat: $lat, lon: $lon)';
}

class WeatherInfo {
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  final DateTime dtTxt;
  final Rain? rain;

  WeatherInfo({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
    this.rain,
  });

  factory WeatherInfo.fromJson(String str) =>
      WeatherInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherInfo.fromMap(Map<String, dynamic> json) => WeatherInfo(
        dt: json["dt"],
        main: Main.fromMap(json["main"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        clouds: Clouds.fromMap(json["clouds"]),
        wind: Wind.fromMap(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: Sys.fromMap(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "main": main.toMap(),
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "clouds": clouds.toMap(),
        "wind": wind.toMap(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toMap(),
        "dt_txt": dtTxt.toIso8601String(),
        "rain": rain?.toMap(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherInfo &&
        other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.sys == sys &&
        other.dtTxt == dtTxt &&
        other.rain == rain;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        sys.hashCode ^
        dtTxt.hashCode ^
        rain.hashCode;
  }

  @override
  String toString() {
    return 'WeatherInfo(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dtTxt: $dtTxt, rain: $rain)';
  }
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(String str) => Clouds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toMap() => {
        "all": all,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Clouds && other.all == all;
  }

  @override
  int get hashCode => all.hashCode;

  @override
  String toString() => 'Clouds(all: $all)';
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(String str) => Main.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Main.fromMap(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Main &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel &&
        other.humidity == humidity &&
        other.tempKf == tempKf;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        seaLevel.hashCode ^
        grndLevel.hashCode ^
        humidity.hashCode ^
        tempKf.hashCode;
  }

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, seaLevel: $seaLevel, grndLevel: $grndLevel, humidity: $humidity, tempKf: $tempKf)';
  }
}

class Rain {
  final double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the3H: json["3h"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "3h": the3H,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rain && other.the3H == the3H;
  }

  @override
  int get hashCode => the3H.hashCode;

  @override
  String toString() => 'Rain(the3H: $the3H)';
}

class Sys {
  final String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(String str) => Sys.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
        pod: json["pod"],
      );

  Map<String, dynamic> toMap() => {
        "pod": pod,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sys && other.pod == pod;
  }

  @override
  int get hashCode => pod.hashCode;

  @override
  String toString() => 'Sys(pod: $pod)';
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(String str) => Wind.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wind &&
        other.speed == speed &&
        other.deg == deg &&
        other.gust == gust;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode ^ gust.hashCode;

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg, gust: $gust)';
}
