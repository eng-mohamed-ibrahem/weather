import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/result_handler/result_handler.dart';
import 'package:weather/core/utils/network_connection/network_connection.dart';
import 'package:weather/data_source/weather_data_source/weather_data_source.dart';
import 'package:weather/model/weather_model/weather_model.dart';
import 'package:weather/repositories/weather_repo/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  WeatherRepoImpl({
    required WeatherDataSource weatherDataSource,
  }) : _weatherDataSource = weatherDataSource;
  final WeatherDataSource _weatherDataSource;

  @override
  Future<ResultHandler<WeatherModel, Failure>> getWeatherByCityName(
      String cityName) async {
    if (await NetworkConnection.isConnected()) {
      return _weatherDataSource.getWeatherByCityName(cityName);
    } else {
      return const ResultHandler.failure(
          failure: NoInternetFailure(message: 'No internet connection'));
    }
  }
}
