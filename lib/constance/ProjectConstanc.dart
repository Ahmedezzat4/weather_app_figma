import 'package:flutter/material.dart';

String apiKey = 'f1f1a570e00d457c824102819251905';
String baseURL = 'http://api.weatherapi.com/v1';

String getStartPageRoute = '/get_start_page';
String todayPageRoute = '/today_page';
String forecastPageRoute = '/forecast_page';
String setLocationRoute = '/set_location';
String imageHouse = 'assets/images/House.png';
String imageGetStart = 'assets/images/Sun cloud mid rain.png';
List<Color> colorsOfPage = [
  Color(0xFF1B2444),
  Color(0xff443A8C), // Start color
  Color(0xff8A3EA0),
];// End color