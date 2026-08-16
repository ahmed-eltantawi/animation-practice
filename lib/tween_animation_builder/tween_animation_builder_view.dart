import 'package:flutter/material.dart';

class TweenAnimationBuilderView extends StatelessWidget {
  const new({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 100),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return SizedBox(width: 100, height: 100, child: Text(value.toString()));
      },
    );
  }
}
