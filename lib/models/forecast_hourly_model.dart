import 'package:json_annotation/json_annotation.dart';

part 'forecast_hourly_model.g.dart';

@JsonSerializable()
class ForecastHourlyModel {
  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  final DateTime? time;
  final String? icon;
  final double? temperature;
  final double? humidity;
  final double? precipProbability;

  ForecastHourlyModel(this.time, this.icon, this.temperature, this.humidity,
      this.precipProbability);

  static DateTime _fromJson(int int) =>
      DateTime.fromMicrosecondsSinceEpoch(1000000 * int);
  static int _toJson(DateTime? time) => time!.millisecondsSinceEpoch;

  factory ForecastHourlyModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyModelFromJson(json);
}
