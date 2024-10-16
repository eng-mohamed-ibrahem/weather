import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String cityName,
    required double temp,
    required String description,
    required String icon,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
