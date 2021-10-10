import 'package:flutter_weather_app1/models/forecast_current.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forecast_daily.dart';
import 'forecast_hourly.dart';

//part 'example.g.dart';
part 'forecast_response.g.dart';

@JsonSerializable()
class ForecastResponse {
  final double? latitude;
  final double? longitude;
  final String? timezone;
  final ForecastCurrent? currently;
  final ForecastHourly? hourly;
  final ForecastDaily? daily;

  ForecastResponse(this.latitude, this.longitude, this.timezone, this.currently,
      this.hourly, this.daily);

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  //Person({required this.firstName, required this.lastName, this.dateOfBirth});
  //factory ForecastResponse.fromJson(Map<String, dynamic> json) => _$ForecastResponseFromJson(json);
  //Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);

  // ForecastResponse.fromJson(Map<String, dynamic> json)
  //     : latitude = json['latitude'],
  //       longitude = json['longitude'],
  //       timezone = json['timezone'],
  //       currently = json['currently'];
}
