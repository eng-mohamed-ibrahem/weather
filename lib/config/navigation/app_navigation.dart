import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/config/navigation/roues.dart';
import 'package:weather/data_source/weather_data_source/remote_dio_weather_data_source.dart';
import 'package:weather/repositories/weather_repo/weather_repo_impl.dart';
import 'package:weather/view_model/weather_viewmodel/weather_viewmodel.dart';
import 'package:weather/views/screens/home.dart';

class AppNavigation {
  static GoRouter routerConfig = GoRouter(
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home.path,
        builder: (context, state) {
          return BlocProvider<WeatherViewModel>(
            lazy: false,
            create: (context) => WeatherViewModel(
              weatherRepo: WeatherRepoImpl(
                weatherDataSource: RemoteDioWeatherDataSource(),
              ),
            ),
            child: const Home(),
          );
        },
      ),
    ],
  );
}
