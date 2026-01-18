import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    return BlocListener<GetWeatherCubit, GetWeatherState>(
      listener: (context, state) {
        if (state is WeatherPermissionDeniedState) {
          Navigator.pushReplacementNamed(context, '/set_location');
        }

        if (state is WeatherLoadedState) {
          Navigator.pushReplacementNamed(context, '/today_page');
        }

        if (state is WeatherFailureState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorsOfPage,
              begin: Alignment.topCenter, // Start from the top-left
              end: Alignment.bottomCenter, // End at the bottom-right
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(imageGetStart, fit: BoxFit.cover),
                ),
                SizedBox(height: 25),
                Text(
                  'Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 54,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'ForeCasts',
                  style: TextStyle(
                    height: .8,
                    color: Color(0xffD8AD2F),
                    fontSize: 54,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,

                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 75),

                SizedBox(
                  height: 72,
                  width: 304,
                  child: FloatingActionButton(
                    onPressed: () async {
                      await Geolocator.requestPermission();

                      context.read<GetWeatherCubit>().getWeatherByLocation();
                    },

                    backgroundColor: Color(0xffD7AC2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      'Get Start',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
