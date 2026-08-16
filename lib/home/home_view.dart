import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => Container(color: Colors.red),
        ),
      ),
    );
  }
}
