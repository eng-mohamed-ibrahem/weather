import 'package:dio/dio.dart';
import 'package:weather/core/constants/api_constants.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/result_handler/result_handler.dart';
import 'package:weather/data_source/weather_data_source/weather_data_source.dart';
import 'package:weather/model/weather_model/weather_model.dart';

class RemoteDioWeatherDataSource implements WeatherDataSource {
  @override
  Future<ResultHandler<WeatherModel, Failure>> getWeatherByCityName(
      String cityName) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
      ),
    );

    try {
      Response response = await dio.get(
        ApiConstants.weather,
        queryParameters: {
          "q": cityName,
          "units": "imperial",
          "appid": ApiConstants.apiKey
        },
      );
      if (response.statusCode == 200) {
        if (response.data["cod"] == 200) {
          return ResultHandler.success(
            data: WeatherModel(
              cityName: response.data["name"],
              temp: response.data["main"]["temp"],
              description: response.data["weather"][0]["description"],
              icon:
                  'https://openweathermap.org/img/wn/${response.data['weather'][0]['icon']}@2x.png',
            ),
          );
        }
        if (response.data["cod"] == "404") {
          return ResultHandler.failure(
              failure: NoCityFoundFailure(message: response.data["message"]));
        }
      }
      throw Exception();
    } on DioException catch (e) {
      return ResultHandler.failure(failure: ApiFailure.fromDioError(e));
    } catch (e) {
      return ResultHandler.failure(
          failure: UnknownFailure(message: 'Unknown Failure'));
    }
  }
}
