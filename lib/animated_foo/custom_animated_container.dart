import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const new({super.key, required this.direction, required this.color});
  final double direction;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeInOutQuint,
      duration: Duration(seconds: 1),
      tween: Tween<double>(begin: 100, end: direction),
      builder: (context, value, child) =>
          Container(height: direction, width: direction, color: color),
    );
  }
}

class MyClass<T> {
  final T begging;
  final T end;

  MyClass({required this.begging, required this.end});
}
