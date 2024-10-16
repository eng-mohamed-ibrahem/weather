import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInput extends StatelessWidget {
  const WeatherInput(
      {super.key, required this.controller, required this.onSearched});
  final TextEditingController controller;
  final Function(String cityName) onSearched;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.blueAccent,
      style: const TextStyle(
        color: Colors.blueAccent,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: 'Enter city name',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.location_city, color: Colors.blue),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            onSearched(controller.text);
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
