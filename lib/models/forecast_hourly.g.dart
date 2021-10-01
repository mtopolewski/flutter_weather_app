// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHourly _$ForecastHourlyFromJson(Map<String, dynamic> json) =>
    ForecastHourly(
      json['summary'] as String?,
      json['icon'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => ForecastHourlyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastHourlyToJson(ForecastHourly instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'icon': instance.icon,
      'data': instance.data,
    };
