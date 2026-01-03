import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/helper/DateTimeParth.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';
import 'package:weather_app_figma/widgets/Custom_Text.dart';
import 'package:weather_app_figma/widgets/One_Clock_Widget.dart';

class TodayPage extends StatelessWidget {
  final WeatherModel weatherModel;
  const TodayPage({required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorsOfPage,
            begin: Alignment.topLeft, // Start from the top-left
            end: Alignment.bottomRight, // End at the bottom-right
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 75),
              Container(
                height: 200,
                width: 200,
                child: Image.network(
                  imageUrlParth(weatherModel.image),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                '   ${weatherModel.temperature}°',
                style: TextStyle(color: Colors.white, fontSize: 54, height: .2),
              ),
              SizedBox(height: 35),
              Custom_Text(text: weatherModel.weatherCondition),
              SizedBox(height: 8.5),
              Custom_Text(
                text:
                    'Max: ${weatherModel.maxTemp}°   Min: ${weatherModel.minTemp}°',
              ),
              SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    Image.asset(imageHouse),
                    Positioned.fill(
                      top: 220,

                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF5E45A6),
                              Color(0xff704FA4), // Start color
                              Color(0xff8743A2), // End color
                            ],
                            begin:
                                Alignment.topCenter, // Start from the top-left
                            end: Alignment.bottomCenter,
                            // End at the bottom-right
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                                right: 35,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    todayDate(weatherModel.currentDate),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Add more widgets here for today's highlights
                            Divider(color: Colors.white54),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  One_Clock_Widget(
                                    degree:
                                        (weatherModel.firstFourHours[0].temp)
                                            .toString(),
                                    time: hourParth(
                                      (weatherModel.firstFourHours[0].hour)
                                          .toString(),
                                    ),
                                    imagePath:
                                        weatherModel.firstFourHours[0].image,
                                  ),

                                  One_Clock_Widget(
                                    degree:
                                        (weatherModel.firstFourHours[1].temp)
                                            .toString(),
                                    time: hourParth(
                                      (weatherModel.firstFourHours[1].hour)
                                          .toString(),
                                    ),
                                    imagePath:
                                        weatherModel.firstFourHours[1].image,
                                  ),
                                  One_Clock_Widget(
                                    degree:
                                        (weatherModel.firstFourHours[2].temp)
                                            .toString(),
                                    time: hourParth(
                                      (weatherModel.firstFourHours[2].hour)
                                          .toString(),
                                    ),
                                    imagePath:
                                        weatherModel.firstFourHours[2].image,
                                  ),
                                  One_Clock_Widget(
                                    degree:
                                        (weatherModel.firstFourHours[3].temp)
                                            .toString(),
                                    time: hourParth(
                                      (weatherModel.firstFourHours[3].hour)
                                          .toString(),
                                    ),
                                    imagePath:
                                        weatherModel.firstFourHours[3].image,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.location_on),
                                    iconSize: 30,
                                    color: Colors.grey,
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/set_location',
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline_rounded,
                                    ),
                                    iconSize: 30,
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/forecast_page',
                                      );
                                    },
                                    icon: Icon(Icons.reorder),
                                    iconSize: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
