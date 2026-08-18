import 'package:flutter/material.dart';

class FooTransitionWidgets extends StatefulWidget {
  const new({super.key});

  @override
  State<FooTransitionWidgets> createState() => _FooTransitionWidgetsState();
}

class _FooTransitionWidgetsState extends State<FooTransitionWidgets>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _redAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 4),
    );

    _greenAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(_controller);
    _redAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _stackWidget());
  }

  Stack _stackWidget() {
    return Stack(
      children: [
        AlignTransition(
          alignment: _greenAnimation,
          child: CircleAvatar(radius: 50, backgroundColor: Colors.green),
        ),
        AlignTransition(
          alignment: _redAnimation,
          child: CircleAvatar(radius: 50, backgroundColor: Colors.red),
        ),
      ],
    );
  }
}
