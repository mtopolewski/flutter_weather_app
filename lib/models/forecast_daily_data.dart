import 'package:json_annotation/json_annotation.dart';

part 'forecast_daily_data.g.dart';

@JsonSerializable()
class ForecastDailyData {
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? time;
  final String? icon;
  final double? temperatureHigh;
  final double? humidity;
  final double? precipProbability;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? sunriseTime;
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? sunsetTime;
  final double? windSpeed;
  final double? visibility;
  final int? uvIndex;

  ForecastDailyData(
      this.time,
      this.icon,
      this.temperatureHigh,
      this.humidity,
      this.precipProbability,
      this.sunriseTime,
      this.sunsetTime,
      this.windSpeed,
      this.visibility,
      this.uvIndex);

  static DateTime _fromJson(int int) =>
      DateTime.fromMicrosecondsSinceEpoch(1000000 * int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;

  factory ForecastDailyData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDailyDataFromJson(json);
}
