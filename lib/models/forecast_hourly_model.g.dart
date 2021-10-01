// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHourlyModel _$ForecastHourlyModelFromJson(Map<String, dynamic> json) =>
    ForecastHourlyModel(
      json['time'] as int?,
      json['icon'] as String?,
      (json['temperature'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ForecastHourlyModelToJson(
        ForecastHourlyModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'icon': instance.icon,
      'temperature': instance.temperature,
    };
