// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      cityName: json['cityName'] as String,
      temp: (json['temp'] as num).toDouble(),
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'temp': instance.temp,
      'description': instance.description,
      'icon': instance.icon,
    };
