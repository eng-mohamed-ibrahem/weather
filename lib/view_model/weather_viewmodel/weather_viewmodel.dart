import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/model/weather_model/weather_model.dart';
import 'package:weather/repositories/weather_repo/weather_repo.dart';

import '../../core/failure/failure.dart';

part 'weather_viewmodel.freezed.dart';
part 'weather_viewmodel_state.dart';

class WeatherViewModel extends Cubit<WeatherViewModelState> {
  WeatherViewModel({
    required WeatherRepo weatherRepo,
  })  : _weatherRepo = weatherRepo,
        super(const _Initial());

  final WeatherRepo _weatherRepo;

  Future<void> getWeatherByCityName(String cityName) async {
    emit(const _Loading());
    final result = await _weatherRepo.getWeatherByCityName(cityName);
    result.when(
      success: (weatherModel) {
        emit(_Success(weatherModel: weatherModel));
      },
      failure: (failure) {
        emit(_Failure(failure: failure));
      },
    );
  }
}
