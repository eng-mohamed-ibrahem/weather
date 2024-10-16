import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('BlocObserver: onCreate -- ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('BlocObserver: onClose -- ${bloc.runtimeType}');

    super.onClose(bloc);
  }
}
