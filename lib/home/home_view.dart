import 'package:animation_practise/animated_foo/animated_foo_view.dart';
import 'package:animation_practise/tween_animation_builder/tween_animation_builder_view.dart';
import 'package:animation_practise/tween_animation_builder/tween_animation_builder_with_child_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const new({super.key});
  final List<Widget> animations = const [
    AnimatedFoo(),
    TweenAnimationBuilderView(),
    TweenAnimationBuilderWithChildView(),
  ];
  final List<String> titles = const [
    "Animated Foo",
    "Tween Animation Builder",
    "Tween Animation Builder With Child",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: animations.length,
        itemBuilder: (context, index) {
          return Card(title: titles[index], screen: animations[index]);
        },
      ),
    );
  }
}

class Card extends StatelessWidget {
  const new({super.key, required this.title, required this.screen});
  final String title;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        color: Colors.amber,
        child: Center(
          child: Text(
            title,
            textAlign: .center,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
