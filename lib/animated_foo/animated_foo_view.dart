import 'package:animation_practise/animated_foo/custom_animated_container.dart';
import 'package:flutter/material.dart';

class AnimatedFoo extends StatefulWidget {
  const new({super.key});

  @override
  @override
  State<AnimatedFoo> createState() => _AnimatedFooState();
}

class _AnimatedFooState extends State<AnimatedFoo> {
  double _direction = 100;
  Color _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            CustomAnimatedContainer(direction: _direction, color: _color),
            customButton(),
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
        _color == Colors.red ? _color = Colors.green : _color = Colors.red;
        setState(() {});
      },
      child: const Text('Start Animation'),
    );
  }
}
