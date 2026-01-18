import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/models/CityName_model.dart';

class LocationSearchCubit extends Cubit<List<CityModel>> {
  LocationSearchCubit() : super([]);

  Timer? _debounce;
  String _lastQuery = '';

  final Dio _dio = Dio();

  void searchCity(String text) {
    _lastQuery = text;

    if (text.length < 2) {
      emit([]);
      return;
    }

    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      try {
        final response = await _dio.get(
          '$baseURL/search.json',
          queryParameters: {'key': apiKey, 'q': text},
        );

        // تجاهل أي response قديم
        if (text != _lastQuery) return;

        final cities = (response.data as List)
            .map((e) => CityModel.fromJson(e))
            .toList();

        emit(cities);
      } catch (_) {
        if (text == _lastQuery) {
          emit([]);
        }
      }
    });
  }

  void clear() {
    _lastQuery = '';
    emit([]);
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    _dio.close();
    return super.close();
  }
}
