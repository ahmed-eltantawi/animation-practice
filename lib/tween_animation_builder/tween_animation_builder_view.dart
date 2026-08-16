import 'package:flutter/material.dart';

class TweenAnimationBuilderView extends StatelessWidget {
  const new({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 100),
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return Text(
              value.toString().substring(0, 3),
              style: TextStyle(fontSize: 60),
            );
          },
        ),
      ),
    );
  }
}
