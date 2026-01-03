import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';
import 'package:weather_app_figma/pages/forecast_page.dart';

class Forcast_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return ForcastPage(weatherModel: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
