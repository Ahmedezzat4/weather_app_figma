part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

class GetWeatherCubitInitial extends GetWeatherState {
  final WeatherModel? cachedWeather;
  GetWeatherCubitInitial({this.cachedWeather});
}

class WeatherLoading extends GetWeatherState {
  final WeatherModel? cachedWeather;
  WeatherLoading(this.cachedWeather);
}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherPermissionDeniedState extends GetWeatherState {}

class WeatherNeedLocation extends GetWeatherState {}

class WeatherFailureState extends GetWeatherState {
  final String errorMessage;
  final WeatherModel? cachedWeather;

  WeatherFailureState({
    this.errorMessage = "Failed to fetch weather data.",
    this.cachedWeather,
  });
}
