import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/helper/DateTimeParth.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';
import 'package:weather_app_figma/widgets/Custom_Text.dart';
import 'package:weather_app_figma/widgets/Custom_box_forcast.dart';
import 'package:weather_app_figma/widgets/Day_Scroller_Forcast.dart';

class ForcastPage extends StatelessWidget {
  final WeatherModel weatherModel;
  const ForcastPage({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorsOfPage, // End color
            begin: Alignment.topCenter, // Start from the top-left
            end: Alignment.bottomCenter, // End at the bottom-right
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Custom_Text(text: weatherModel.name),
              SizedBox(height: 10),
              Custom_Text(
                text:
                    'Max: ${weatherModel.maxTemp}°   Min: ${weatherModel.minTemp}°',
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Custom_Text(
                    text: '7-Days Forecasts',
                    fontweight: FontWeight.bold,
                  ),
                ),
              ),
              DaysScroller(weatherModel: weatherModel),

              SizedBox(height: 30),
              Container(
                height: 155,
                width: 345,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8E4CA4),
                      Color(0xFF3B2B8A), // End color
                    ],
                    begin: Alignment.bottomLeft, // Start from the top-left
                    end: Alignment.topRight, // End at the bottom-right
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Icon(Icons.air_sharp, color: Colors.white),
                            Text(
                              '   AIR QUALITY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '3-Low Health Risk',
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          height: 5,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff7E55BF),
                                Color(0xFF362A84), // End color
                              ],
                              begin: Alignment
                                  .bottomLeft, // Start from the top-left
                              end:
                                  Alignment.topRight, // End at the bottom-right
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 6,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Custom_Box_Forcast(
                        title: 'SUNRISE',
                        firstText: weatherModel.sunrise,
                        secondText: 'Sunset: ${weatherModel.sunset}',
                        fontsize_secondText: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Custom_Box_Forcast(
                        title: 'UV INDEX',
                        firstText: '${weatherModel.uv}',
                        secondText: getUvLevelDescription(weatherModel.uv),
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.reorder, color: Colors.white, size: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
