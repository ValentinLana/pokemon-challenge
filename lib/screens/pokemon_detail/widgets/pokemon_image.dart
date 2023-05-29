import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/pokeball.png',
            color: Colors.white.withOpacity(0.2),
            width: 170,
            height: 170,
          ),
        ),
        Center(
          child: Image.network(
            'https://pokemon.gishan.cc/static/i/p/$name.png',
            width: 150,
            height: 150,
          ),
        ),
      ],
    );
  }
}
