import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather/core/failure/failure.dart';
import 'package:weather/core/methods/helper_methods.dart';
import 'package:weather/view_model/weather_viewmodel/weather_viewmodel.dart';
import 'package:weather/views/widgets/weather_info.dart';
import 'package:weather/views/widgets/weather_input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: BlocBuilder<WeatherViewModel, WeatherViewModelState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
                Text(
                  'Weather',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                WeatherInput(
                  controller: _controller,
                  onSearched: (cityName) {
                    context
                        .read<WeatherViewModel>()
                        .getWeatherByCityName(cityName);
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                () {
                  return state.when(
                    initial: () {
                      return const Center(
                        child: Text("Initial"),
                      );
                    },
                    loading: () {
                      return Skeletonizer(
                        child: WeatherInfo.skeleton(),
                      );
                    },
                    success: (weatherModel) {
                      return WeatherInfo(
                        weatherModel: weatherModel,
                      );
                    },
                    failure: (failure) {
                      if (failure is NoCityFoundFailure) {
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                failure.message,
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              Text(
                                "make sure the city name is correct",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              failure.message,
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                context
                                    .read<WeatherViewModel>()
                                    .getWeatherByCityName(_controller.text);
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text("Retry"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                ElevatedButton.icon(
                  onPressed: state.maybeWhen(
                    loading: () => null,
                    orElse: () => () {
                      if (_controller.text.isEmpty) {
                        showSnackBar(context, "Please enter city name");
                        return;
                      }
                      context
                          .read<WeatherViewModel>()
                          .getWeatherByCityName(_controller.text);
                    },
                  ),
                  label: const Text("Search"),
                  icon: state.whenOrNull(
                    loading: () => SizedBox(
                      height: 15.h,
                      width: 15.w,
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
