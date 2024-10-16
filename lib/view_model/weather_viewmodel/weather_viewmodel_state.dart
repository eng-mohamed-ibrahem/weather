part of 'weather_viewmodel.dart';

@freezed
class WeatherViewModelState with _$WeatherViewModelState {
  const factory WeatherViewModelState.initial() = _Initial;
  const factory WeatherViewModelState.loading() = _Loading;
  const factory WeatherViewModelState.success(
      {required WeatherModel weatherModel}) = _Success;
  const factory WeatherViewModelState.failure({required Failure failure}) =
      _Failure;
}
