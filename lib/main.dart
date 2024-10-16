import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/cubit_observer/cubit_observer.dart';
import 'package:weather/root_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CubitObserver();
  runApp(const RootApp());
}
