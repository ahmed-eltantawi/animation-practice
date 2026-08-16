import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
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
