import 'package:animation_practise/animated_foo/animated_foo_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const new({super.key});
  final List<Widget> animations = const [AnimatedFoo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: animations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => animations[index]),
              );
            },
            child: Container(
              color: Colors.amber,
              child: Center(
                child: Text(
                  "Animated Foo",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
