// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDaily _$ForecastDailyFromJson(Map<String, dynamic> json) =>
    ForecastDaily(
      json['summary'] as String?,
      json['icon'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ForecastDailyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDailyToJson(ForecastDaily instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'icon': instance.icon,
      'data': instance.data,
    };
