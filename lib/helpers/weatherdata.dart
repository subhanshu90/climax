import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import 'hourlyweather.dart';

var data;
List parsedData = [];

class CurrWeather {
  final String sunrise;
  final String sunset;
  final int temp;
  final int feels_like;
  final double pressure;
  final int humidity;
  final double windspeed;
  final String status;
  final String icon;
  final int max;
  final int min;
  final String region;
  final String city;
  final String moonPhase;
  final int rainchance;

  CurrWeather({
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feels_like,
    required this.pressure,
    required this.humidity,
    required this.icon,
    required this.status,
    required this.windspeed,
    required this.max,
    required this.min,
    required this.city,
    required this.region,
    required this.moonPhase,
    required this.rainchance,
  });

  factory CurrWeather.fromJson(Map json) {
    return CurrWeather(
        sunrise: json["forecast"]["forecastday"][0]["astro"]["sunrise"],
        sunset: json["forecast"]["forecastday"][0]["astro"]["sunset"],
        moonPhase: json["forecast"]["forecastday"][0]["astro"]["moon_phase"],
        temp: json["current"]["temp_c"].round(),
        feels_like: json["current"]["feelslike_c"].round(),
        pressure: json["current"]["pressure_mb"],
        humidity: json["current"]["humidity"],
        icon: json["current"]["condition"]["icon"],
        status: json["current"]["condition"]["text"],
        windspeed: json["current"]["wind_kph"],
        max: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"].round(),
        min: json["forecast"]["forecastday"][0]["day"]["mintemp_c"].round(),
        region: json["location"]["region"],
        city: json["location"]["name"],
        rainchance: json["forecast"]["forecastday"][0]["day"]
            ["daily_chance_of_rain"]);
  }

  List<Tuple2> toList() {
    return [
      Tuple2('sunrise', sunrise),
      Tuple2('sunset', sunset),
      Tuple2('temp', temp.toString()),
      Tuple2('moonPhase', moonPhase),
      Tuple2('pressure', pressure.toString()),
      Tuple2('humidity', humidity.toString()),
      Tuple2('windspeed', windspeed.toString()),
      Tuple2('max', max.toString()),
      Tuple2('min', min.toString()),
      Tuple2('rainchance', rainchance.toString())
    ];
  }
}

String api = '8c29489d3b174df582c183631222604';

Future getData(String query) async {
  var url =
      'http://api.weatherapi.com/v1/forecast.json?key=$api&q=$query&days=1&aqi=no&alerts=no';
  var resp = await http.get(Uri.parse(url));
  if (resp.statusCode == 200) {
    data = await jsonDecode(resp.body);
    parsedData = await data["forecast"]["forecastday"][0]["hour"];
    return data;
  } else {
    throw Exception('failed to load');
  }
}

Future getcurrweatherdata(dynamic data) async {
  return CurrWeather.fromJson(data);
}

Future gethourlydata() async {
  hourlydata.clear();
  for (var item in parsedData) {
    HourlyWeather kek = HourlyWeather(
        time: DateTime.fromMillisecondsSinceEpoch(item["time_epoch"] * 1000),
        temp: item["temp_c"].round());
    hourlydata.add(kek);
  }
  return hourlydata;
}
