import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:fluttercompass/cubit/states.dart';

class CompassCubit extends Cubit<CompassStates> {
  CompassCubit() : super(CompassInitialStates());
  static CompassCubit get(context) => BlocProvider.of(context);
  double? heading;
  void getCompass() {
    FlutterCompass.events!.listen((event) {
      heading = event.heading!;
      emit(CompassSuccess());
    });
  }
}
