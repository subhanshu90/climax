import 'dart:convert';
import 'package:http/http.dart' as http;

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
}

String api = '8c29489d3b174df582c183631222604';

Future getData(double? latitude, double? longitude) async {
  var url =
      'http://api.weatherapi.com/v1/forecast.json?key=$api&q=$latitude,$longitude&days=1&aqi=no&alerts=no';
  var resp = await http.get(Uri.parse(url));
  if (resp.statusCode == 200) {
    var data = jsonDecode(resp.body);

    return CurrWeather.fromJson(data);
  } else {
    throw Exception('failed to load');
  }
}
