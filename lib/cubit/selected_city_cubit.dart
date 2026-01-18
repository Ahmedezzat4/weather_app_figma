import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/models/CityName_model.dart';

class SelectedCityCubit extends Cubit<CityModel?> {
  SelectedCityCubit() : super(null);

  void selectCity(CityModel city) {
    emit(city);
  }

  void clear() {
    emit(null);
  }
}
