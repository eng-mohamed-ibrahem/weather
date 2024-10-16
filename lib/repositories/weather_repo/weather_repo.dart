import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/result_handler/result_handler.dart';
import 'package:weather/model/weather_model/weather_model.dart';

abstract class WeatherRepo {
  Future<ResultHandler<WeatherModel, Failure>> getWeatherByCityName(
      String cityName);
}
