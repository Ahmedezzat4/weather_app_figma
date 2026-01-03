part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherCubitInitial extends GetWeatherState {}

class WeatherLoading extends GetWeatherState {}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends GetWeatherState {
  final String errorMessage;

  WeatherFailureState({this.errorMessage = "Failed to fetch weather data."});
}
