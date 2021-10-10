// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHourlyModel _$ForecastHourlyModelFromJson(Map<String, dynamic> json) =>
    ForecastHourlyModel(
      ForecastHourlyModel._fromJson(json['time'] as int),
      json['icon'] as String?,
      (json['temperature'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['precipProbability'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ForecastHourlyModelToJson(
        ForecastHourlyModel instance) =>
    <String, dynamic>{
      'time': ForecastHourlyModel._toJson(instance.time),
      'icon': instance.icon,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'precipProbability': instance.precipProbability,
    };
