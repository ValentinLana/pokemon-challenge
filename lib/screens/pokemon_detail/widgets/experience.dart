import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key, required this.experience}) : super(key: key);

  final int experience;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$experience Exp',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
