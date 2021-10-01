import 'package:json_annotation/json_annotation.dart';

part 'forecast_hourly_model.g.dart';

@JsonSerializable()
class ForecastHourlyModel {
  final int? time;
  final String? icon;
  final double? temperature;

  ForecastHourlyModel(this.time, this.icon, this.temperature);

  factory ForecastHourlyModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyModelFromJson(json);
}
