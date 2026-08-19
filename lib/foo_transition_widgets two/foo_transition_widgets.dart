import 'package:flutter/material.dart';

class FooTransitionWidgetsTwo extends StatefulWidget {
  const new({super.key});

  @override
  State<FooTransitionWidgetsTwo> createState() => _FooTransitionWidgetsState();
}

class _FooTransitionWidgetsState extends State<FooTransitionWidgetsTwo>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _redAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 1),
    );

    _greenAnimation =
        Tween<AlignmentGeometry>(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.bounceIn,
            reverseCurve: Curves.bounceOut,
          ),
        );
    _redAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _stackWidget()),
          _buttons(),
          const SizedBox(height: 40),
        ],
      ),
    );
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

  Widget _buttons() {
    return Wrap(
      children: [
        ElevatedButton(
          onPressed: () {
            _controller.forward();
          },
          child: const Text("Forward"),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.stop();
          },
          child: const Text("Stop"),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.reverse();
          },
          child: const Text("Reverse"),
        ),

        ElevatedButton(
          onPressed: () {
            _controller.reset();
          },
          child: const Text("Reset"),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.repeat();
          },
          child: const Text("Repeat without reverse"),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.repeat(reverse: true);
          },
          child: const Text("Repeat with reverse"),
        ),
      ],
    );
  }
}
