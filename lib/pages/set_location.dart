import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';

class SetLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorsOfPage,
            begin: Alignment.topLeft, // Start from the top-left
            end: Alignment.bottomRight,
            // End at the bottom-right
          ),
        ),
        child: Center(
          child: Column(
            children: [
              // SizedBox(height: 150),
              Container(height: 250, width: 250),
              SizedBox(height: 30),
              Text(
                'Set  Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Please Set city name  to get weather\ninformation for your area.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 60,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<GetWeatherCubit>().getWeather(
                      cityName: cityController.text,
                    );

                    Navigator.pushNamed(context, '/today_page');
                    // Handle location permission request
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff624FA4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Set Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
