import 'package:animation_practise/animated_foo/custom_animated_container.dart';
import 'package:animation_practise/animated_foo/custom_button.dart';
import 'package:flutter/material.dart';

class AnimatedFoo extends StatefulWidget {
  const new({super.key});

  @override
  State<AnimatedFoo> createState() => _AnimatedFooState();
}

class _AnimatedFooState extends State<AnimatedFoo> {
  double _direction = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            SizedBox(height: 100),
            CustomAnimatedContainer(direction: _direction),
            Spacer(),
            customButton(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget customButton() {
    return ElevatedButton(
      onPressed: () {
        if (_direction == 100) {
          _direction = 200;
        } else {
          _direction = 100;
        }
        setState(() {});
      },
      child: const Text('Start Animation'),
    );
  }
}
