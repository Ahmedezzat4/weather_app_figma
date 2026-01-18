import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_figma/date/local/weather_local_storage.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';
import 'package:weather_app_figma/service/weather_Service.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.weatherLocalStorage) : super(GetWeatherCubitInitial()) {
    loadCachedWeather();
  }
  WeatherLocalStorage? weatherLocalStorage;
  WeatherModel? weatherModel;

  Future<void> loadCachedWeather() async {
    final cached = await WeatherLocalStorage().getCachedWeather();
    if (cached != null) {
      emit(WeatherLoadedState(weatherModel: cached));
    } else {
      emit(WeatherNeedLocation());
    }
  }

  Future<void> getWeatherByLocation() async {
    try {
      final cached = await WeatherLocalStorage().getCachedWeather();

      emit(WeatherLoading(cached));
      // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // // if (!serviceEnabled) {
      // //   await Geolocator.openLocationSettings();

      // //   return;
      // // }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        emit(WeatherPermissionDeniedState());
        return;
      }
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        // List<Placemark> placemarks = await placemarkFromCoordinates(
        //   position.latitude,
        //   position.longitude,
        // );

        String? cityName = '${position.latitude},${position.longitude}';

        await getWeather(cityName: cityName);
      }
    } catch (e) {
      emit(WeatherFailureState(errorMessage: e.toString()));
    }
  }

  getWeather({required String cityName}) async {
    try {
      final cached = await WeatherLocalStorage().getCachedWeather();

      emit(WeatherLoading(cached));
      weatherModel = await WeatherServic(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      await WeatherLocalStorage().cacheWeather(weatherModel!);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      final cached = await WeatherLocalStorage().getCachedWeather();
      if (cached != null) {
        emit(
          WeatherFailureState(
            errorMessage: e.toString(),
            cachedWeather: cached,
          ),
        );
      } else {
        emit(WeatherFailureState());
      }
    }
  }
}
