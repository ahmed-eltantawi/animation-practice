import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const new({super.key, required this.direction});
  final double direction;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
      height: direction,
      width: direction,
      color: Colors.red,
    );
  }
}
