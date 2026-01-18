import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';
import 'package:weather_app_figma/pages/get_start_page.dart';
import 'package:weather_app_figma/pages/today_page.dart';

class Today_Widget extends StatelessWidget {
  const Today_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherCubitInitial && state.cachedWeather != null) {
            return (TodayPage(weatherModel: state.cachedWeather!));
          }
          if (state is WeatherLoadedState) {
            return (TodayPage(weatherModel: state.weatherModel));
          }
          if (state is WeatherLoading && state.cachedWeather != null) {
            return (TodayPage(weatherModel: state.cachedWeather!));
          }

          if (state is WeatherFailureState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is WeatherNeedLocation) {
            return GetStartPage();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
