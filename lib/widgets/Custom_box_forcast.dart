import 'package:flutter/material.dart';

class Custom_Box_Forcast extends StatelessWidget {
  final String title;
  final String firstText;
  final String secondText;
  final double fontsize_secondText;
  const Custom_Box_Forcast({
    super.key,
    required this.title,
    required this.firstText,
    required this.secondText,
    this.fontsize_secondText = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color(0xff8948A8),
            Color(0xFF3B2B8B), // End color
          ],
          begin: Alignment.bottomCenter, // Start from the top-left
          end: Alignment.topRight, // End at the bottom-right
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                firstText,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                secondText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontsize_secondText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
