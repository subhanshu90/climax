import 'weatherdata.dart';

class HourlyWeather {
  DateTime time;
  int temp;

  HourlyWeather({required this.time, required this.temp});

  factory HourlyWeather.fromjson(Map json) {
    return HourlyWeather(time: json["time_epoch"], temp: json["temp_c"]);
  }
}

List<HourlyWeather> hourlydata = [];
