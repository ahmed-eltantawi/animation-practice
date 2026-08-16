import 'package:flutter/material.dart';

class TweenAnimationBuilderWithChildView extends StatefulWidget {
  const new({super.key});

  @override
  State<TweenAnimationBuilderWithChildView> createState() =>
      _TweenAnimationBuilderViewState();
}

int animationKey = 0;
double begin = 100;
double end = 300;

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
              curve: Curves.easeInOutBack,
              tween: Tween<double>(begin: begin, end: end),
              duration: const Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text("First Line", style: TextStyle(fontSize: 20)),
                  ),
                  Flexible(
                    child: Text("Second Line", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              builder: (context, value, child) {
                if (value == 300) {
                  begin = 300;
                  end = 100;
                } else if (value == 100) {
                  begin = 100;
                  end = 300;
                }
                return Container(
                  color: Colors.tealAccent,
                  height: value,
                  width: value,
                  child: child,
                );
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
