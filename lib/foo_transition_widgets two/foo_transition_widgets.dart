import 'dart:developer';

import 'package:flutter/material.dart';

class FooTransitionWidgetsTwo extends StatefulWidget {
  const new({super.key});

  @override
  State<FooTransitionWidgetsTwo> createState() => _FooTransitionWidgetsState();
}

class _FooTransitionWidgetsState extends State<FooTransitionWidgetsTwo>
    with TickerProviderStateMixin {
  late Animation<AlignmentGeometry> _greenAnimation;
  late Animation<AlignmentGeometry> _redAnimation;
  late AnimationController _redController;
  late AnimationController _greenController;

  @override
  void initState() {
    super.initState();

    _redController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 1),
    );
    _greenController = AnimationController(
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
            parent: _greenController,
            curve: Curves.easeInOut,
            reverseCurve: Curves.easeInOut,
          ),
        );
    _redAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _redController, curve: Curves.easeInOut));

    _redController.addListener(() {
      log("red Controller value =======> ${_redController.value}");

      if (_redController.value >= 0.5 && _greenController.value == 0) {
        _greenController.forward();
      }

      if (_redController.value <= 0.5 && _greenController.value == 1) {
        _greenController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _redController.dispose();
    _greenController.dispose();
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
            _redController.forward();
          },
          child: const Text("Forward"),
        ),

        ElevatedButton(
          onPressed: () {
            _redController.reverse();
          },
          child: const Text("Reverse"),
        ),
      ],
    );
  }
}
