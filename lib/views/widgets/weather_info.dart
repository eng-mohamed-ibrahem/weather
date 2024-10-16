import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/model/weather_model/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weatherModel,
    this.isSkeleton = false,
  });
  final WeatherModel weatherModel;
  final bool isSkeleton;

  factory WeatherInfo.skeleton() {
    return const WeatherInfo(
      isSkeleton: true,
      weatherModel: WeatherModel(
        cityName: '',
        temp: 0,
        description: '',
        icon: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            '${weatherModel.temp}°C',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                weatherModel.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                radius: 15.r,
                backgroundImage: isSkeleton
                    ? null
                    : NetworkImage(
                        weatherModel.icon,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
