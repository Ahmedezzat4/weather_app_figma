import 'package:flutter/material.dart';
import 'package:weather_app_figma/helper/DateTimeParth.dart';

class One_Clock_Widget extends StatelessWidget {
  final String degree;
  final String time;
  final String imagePath;
  const One_Clock_Widget({
    super.key,
    required this.degree,
    required this.time,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),

      child: Column(
        children: [
          Text(
            '$degree°C',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              width: 40,

              child: Image.network(imageUrlParth(imagePath), fit: BoxFit.cover),
            ),
          ),
          Text(time, style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }
}
