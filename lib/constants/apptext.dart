import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  

  const AppText({
    super.key,
    required this.text,
    this.size = 16,
    this.color = Colors.black,
    this.weight = FontWeight.normal,
    
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}








