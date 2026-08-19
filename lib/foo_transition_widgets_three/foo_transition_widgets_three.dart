import 'package:flutter/material.dart';

class FooTransitionWidgetsThree extends StatefulWidget {
  const new({super.key});

  @override
  State<FooTransitionWidgetsThree> createState() =>
      _FooTransitionWidgetsThreeState();
}

class _FooTransitionWidgetsThreeState extends State<FooTransitionWidgetsThree>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<AlignmentGeometry>(
      begin: .centerLeft,
      end: .centerRight,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AlignTransition(
            alignment: _animation,
            child: const CircleAvatar(backgroundColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
