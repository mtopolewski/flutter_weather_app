import 'package:json_annotation/json_annotation.dart';

import 'forecast_daily_data.dart';

part 'forecast_daily.g.dart';

@JsonSerializable()
class ForecastDaily {
  final String? summary;
  final String? icon;
  final List<ForecastDailyData>? data;

  ForecastDaily(this.summary, this.icon, this.data);

  factory ForecastDaily.fromJson(Map<String, dynamic> json) =>
      _$ForecastDailyFromJson(json);
}
