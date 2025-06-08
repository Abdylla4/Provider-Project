import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Atmbutton extends StatelessWidget {
  IconData icon;
  VoidCallback onPressed;
  String title;
  Atmbutton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black38),
          ),
          Icon(
            icon,
            size: 48,
            color: Colors.black38,
          )
        ],
      ),
    );
  }
}
