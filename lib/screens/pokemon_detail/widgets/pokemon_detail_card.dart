import 'package:flutter/material.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail.dart';

import 'experience.dart';
import 'height_and_weight.dart';
import 'name_and_id.dart';
import 'pokemon_image.dart';
import 'stats.dart';
import 'type_and_ability.dart';

class PokemonDetailCard extends StatelessWidget {
  const PokemonDetailCard({Key? key, required this.pokemonDetail})
      : super(key: key);

  final PokemonDetail pokemonDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 121, 209, 190),
                  Color(0xFF49d0b2)
                ]),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            PokemonImage(name: pokemonDetail.name ?? ''),
            const SizedBox(height: 10),
            NameAndId(
              name: pokemonDetail.name ?? '',
              id: pokemonDetail.id ?? 0,
            ),
            const SizedBox(height: 5),
            Experience(
              experience: pokemonDetail.baseExperience ?? 0,
            ),
            const SizedBox(height: 15),
            TypeAndAbility(
              types: pokemonDetail.types,
              abilities: pokemonDetail.abilities,
            ),
            const SizedBox(height: 15),
            const Divider(
              height: 1,
            ),
            const SizedBox(height: 17),
            HeightAndWeight(
              height: pokemonDetail.height,
              weight: pokemonDetail.weight,
            ),
            const SizedBox(height: 17),
            Stats(stats: pokemonDetail.stats),
            const SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}
