import 'package:flutter/material.dart';

class TweenAnimationBuilderView extends StatefulWidget {
  const new({super.key});

  @override
  State<TweenAnimationBuilderView> createState() =>
      _TweenAnimationBuilderViewState();
}

int animationKey = 0;

class _TweenAnimationBuilderViewState extends State<TweenAnimationBuilderView> {
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
                return Text(value.toString(), style: TextStyle(fontSize: 60));
              },
            ),
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
