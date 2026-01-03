import 'package:flutter/material.dart';
import 'package:weather_app_figma/helper/DateTimeParth.dart';

class One_Day_Widget extends StatelessWidget {
  final String degree;
  final String day;
  final String imagePath;
  final mid_background_color;
  final end_background_color;

  const One_Day_Widget({
    super.key,
    required this.degree,
    required this.day,
    required this.imagePath,
    this.mid_background_color = const Color(0xff624FA4),
    this.end_background_color = const Color(0xff7966B3),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3D2B89),
              mid_background_color, // Start color
              end_background_color, // End color
            ],
            begin: Alignment.topCenter, // Start from the top-left
            end: Alignment.bottomCenter, // End at the bottom-right
          ),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 22,
            bottom: 22,
            left: 7,
            right: 7,
          ),
          child: Column(
            children: [
              Text(
                '$degree°C',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 42,
                  width: 42,

                  child: Image.network('https:$imagePath', fit: BoxFit.cover),
                ),
              ),
              Text(
                dayParth(day),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
