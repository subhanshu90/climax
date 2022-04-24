import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrWeather {
  final String sunrise;
  final String sunset;
  final int temp;
  final int feels_like;
  final int pressure;
  final double humidity;
  final double dewpoint;
  final double windspeed;
  final String status;
  final String desc;
  final String icon;

  CurrWeather(
      {required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.feels_like,
      required this.pressure,
      required this.humidity,
      required this.desc,
      required this.dewpoint,
      required this.icon,
      required this.status,
      required this.windspeed});

  factory CurrWeather.fromJson(Map json) {
    return CurrWeather(
        sunrise: DateFormat('hh:mm a')
            .format(DateTime.fromMillisecondsSinceEpoch(json["sunrise"])),
        sunset: DateFormat('hh:mm a')
            .format(DateTime.fromMillisecondsSinceEpoch(json["sunset"])),
        temp: json["temp"].round(),
        feels_like: json["feels_like"].round(),
        pressure: json["pressure"],
        humidity: json["humidity"].toDouble(),
        desc: json["weather"][0]["description"],
        dewpoint: json["dew_point"],
        icon: json["weather"][0]["icon"],
        status: json["weather"][0]["main"],
        windspeed: json["wind_speed"]);
  }
}

String api = 'fc8eb01067ec99b73f3d5c6517eb678d';

Future getData(double latitude, double longitude) async {
  var url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&appid=$api';
  var resp = await http.get(Uri.parse(url));
  if (resp.statusCode == 200) {
    var data = jsonDecode(resp.body);

    var currentData = data["current"];
    return CurrWeather.fromJson(currentData);
  } else {
    throw Exception('failed to load');
  }
}
