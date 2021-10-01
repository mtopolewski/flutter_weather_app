// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse(
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['timezone'] as String?,
      json['currently'] == null
          ? null
          : ForecastCurrent.fromJson(json['currently'] as Map<String, dynamic>),
      json['hourly'] == null
          ? null
          : ForecastHourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'currently': instance.currently,
      'hourly': instance.hourly,
    };
