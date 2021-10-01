// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastCurrent _$ForecastCurrentFromJson(Map<String, dynamic> json) =>
    ForecastCurrent(
      json['icon'] as String?,
      (json['temperature'] as num?)?.toDouble(),
      (json['windSpeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ForecastCurrentToJson(ForecastCurrent instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'temperature': instance.temperature,
      'windSpeed': instance.windSpeed,
    };
