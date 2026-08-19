import 'package:animation_practise/animated_foo/animated_foo_view.dart';
import 'package:animation_practise/foo_transition_widgets%20two/foo_transition_widgets.dart';
import 'package:animation_practise/foo_transition_widgets/foo_transition_widgets.dart';
import 'package:animation_practise/foo_transition_widgets_three/foo_transition_widgets_three.dart';
import 'package:animation_practise/home/custom_card_widget.dart';
import 'package:animation_practise/tween_animation_builder/tween_animation_builder_view.dart';
import 'package:animation_practise/tween_animation_builder/tween_animation_builder_with_child_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const new({super.key});
  final List<Widget> animations = const [
    AnimatedFoo(),
    TweenAnimationBuilderView(),
    TweenAnimationBuilderWithChildView(),
    FooTransitionWidgets(),
    FooTransitionWidgetsTwo(),
    FooTransitionWidgetsThree(),
  ];
  final List<String> titles = const [
    "Animated Foo",
    "Tween Animation Builder",
    "Tween Animation Builder With Child",
    "Foo Transition Widgets",
    "Foo Transition Widgets two",
    "Foo Transition Widgets three",
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
          return CustomCardWidget(
            title: titles[index],
            screen: animations[index],
          );
        },
      ),
    );
  }
}
