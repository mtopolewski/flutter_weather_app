import 'forecast_hourly_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_hourly.g.dart';

@JsonSerializable()
class ForecastHourly {
  final String? summary;
  final String? icon;
  final List<ForecastHourlyModel>? data;

  ForecastHourly(this.summary, this.icon, this.data);

  factory ForecastHourly.fromJson(Map<String, dynamic> json) =>
      _$ForecastHourlyFromJson(json);
}
