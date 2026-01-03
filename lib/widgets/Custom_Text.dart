import 'package:flutter/material.dart';

class Custom_Text extends StatelessWidget {
  final String text;
  final double fontsize;
  final String fontfamily;
  final FontWeight fontweight;
  final Color color;
  const Custom_Text({
    super.key,
    required this.text,
    this.fontsize = 20,
    this.fontfamily = 'Poppins',
    this.color = Colors.white,
    this.fontweight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: .8,
        color: color,
        fontSize: fontsize,
        fontFamily: fontfamily,
        fontWeight: fontweight,

        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
