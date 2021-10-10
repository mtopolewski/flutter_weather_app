// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_daily_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDailyData _$ForecastDailyDataFromJson(Map<String, dynamic> json) =>
    ForecastDailyData(
      ForecastDailyData._fromJson(json['time'] as int),
      json['icon'] as String?,
      (json['temperatureHigh'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['precipProbability'] as num?)?.toDouble(),
      ForecastDailyData._fromJson(json['sunriseTime'] as int),
      ForecastDailyData._fromJson(json['sunsetTime'] as int),
      (json['windSpeed'] as num?)?.toDouble(),
      (json['visibility'] as num?)?.toDouble(),
      json['uvIndex'] as int?,
    );

Map<String, dynamic> _$ForecastDailyDataToJson(ForecastDailyData instance) =>
    <String, dynamic>{
      'time': ForecastDailyData._toJson(instance.time),
      'icon': instance.icon,
      'temperatureHigh': instance.temperatureHigh,
      'humidity': instance.humidity,
      'precipProbability': instance.precipProbability,
      'sunriseTime': ForecastDailyData._toJson(instance.sunriseTime),
      'sunsetTime': ForecastDailyData._toJson(instance.sunsetTime),
      'windSpeed': instance.windSpeed,
      'visibility': instance.visibility,
      'uvIndex': instance.uvIndex,
    };
