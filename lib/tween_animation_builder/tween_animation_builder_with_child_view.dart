import 'package:flutter/material.dart';

class TweenAnimationBuilderWithChildView extends StatefulWidget {
  const new({super.key});

  @override
  State<TweenAnimationBuilderWithChildView> createState() =>
      _TweenAnimationBuilderViewState();
}

int animationKey = 0;

class _TweenAnimationBuilderViewState
    extends State<TweenAnimationBuilderWithChildView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TweenAnimationBuilder(
              key: ValueKey(animationKey),
              curve: Curves.easeOutCirc,
              tween: IntTween(begin: 0, end: 100),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Container(child: Column(children: []));
              },
            ),

            // button to trigger the animation
            ElevatedButton(
              onPressed: () {
                setState(() {
                  animationKey++;
                });
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}
