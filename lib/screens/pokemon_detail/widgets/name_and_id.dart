import 'package:flutter/material.dart';
import 'package:pokemon_challenge/common/helpers/capitalize.dart';

class NameAndId extends StatelessWidget {
  const NameAndId({Key? key, required this.name, required this.id})
      : super(key: key);

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '#${id.toString().padLeft(4, '0')}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name.capitalize(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
