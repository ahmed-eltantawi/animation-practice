import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const new({super.key, required this.direction, required this.color});
  final double direction;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      height: direction,
      width: direction,
      color: color,
    );
  }
}
