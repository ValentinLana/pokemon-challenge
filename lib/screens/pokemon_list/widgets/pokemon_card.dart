import 'package:flutter/material.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/common/helpers/capitalize.dart';
import 'package:pokemon_challenge/screens/pokemon_detail/screens/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(pokemon),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF49d0b2),
        ),
        child: Stack(
          children: [
            const PokeballDecoration(),
            PokemonImage(
              pokemonId: pokemon.id,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonName(pokemonName: pokemon.name),
                PokemonId(pokemonId: pokemon.id)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PokeballDecoration extends StatelessWidget {
  const PokeballDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 5,
      child: Image.asset(
        'assets/images/pokeball.png',
        width: 80,
        height: 80,
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.pokemonId}) : super(key: key);

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -5,
      bottom: -5,
      child: Image.network(
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png',
      ),
    );
  }
}

class PokemonName extends StatelessWidget {
  const PokemonName({Key? key, required this.pokemonName}) : super(key: key);

  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Text(
        pokemonName.capitalize(),
        style: const TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PokemonId extends StatelessWidget {
  const PokemonId({Key? key, required this.pokemonId}) : super(key: key);

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Text(
        '#${pokemonId.toString().padLeft(4, '0')}',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white.withOpacity(0.3),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
