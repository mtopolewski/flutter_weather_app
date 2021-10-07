import 'package:json_annotation/json_annotation.dart';

part 'forecast_current.g.dart';

@JsonSerializable()
class ForecastCurrent {
  String? icon;
  double? temperature;
  double? apparentTemperature;
  double? windSpeed;

  //String get temperatureStr => temperature!.toStringAsFixed(2);

  ForecastCurrent(this.icon, this.temperature, this.windSpeed);

  factory ForecastCurrent.fromJson(Map<String, dynamic> json) =>
      _$ForecastCurrentFromJson(json);
  // "time": 1632929329,
  // "summary": "Overcast",
  // "icon": "cloudy",
  // "precipIntensity": 0,
  // "precipProbability": 0,
  // "temperature": 15.28,
  // "apparentTemperature": 15.28,
  // "dewPoint": 8.8,
  // "humidity": 0.65,
  // "pressure": 1020,
  // "windSpeed": 23.92,
  // "windGust": 36,
  // "windBearing": 128,
  // "cloudCover": 0.99,
  // "uvIndex": 0,
  // "visibility": 16.093,
  // "ozone": 273

  // ForecastCurrent.fromJson(Map<String, dynamic> json)
  //     : icon = json['icon'],
  //       temperature = json['temperature'],
  //       windSpeed = json['windSpeed'];
}
