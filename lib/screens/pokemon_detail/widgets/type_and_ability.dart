import 'package:flutter/material.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail.dart';
import 'package:pokemon_challenge/common/helpers/capitalize.dart';

class TypeAndAbility extends StatelessWidget {
  const TypeAndAbility({Key? key, this.abilities, this.types})
      : super(key: key);

  final List<Ability>? abilities;
  final List<Type>? types;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PokemonType(types: types),
        PokemonAbility(abilities: abilities)
      ],
    );
  }
}

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, this.types}) : super(key: key);

  final List<Type>? types;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Type',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (types != null)
            for (Type t in types!)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      t.type?.name?.capitalize() ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}

class PokemonAbility extends StatelessWidget {
  const PokemonAbility({Key? key, this.abilities}) : super(key: key);

  final List<Ability>? abilities;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Ability',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          if (abilities != null)
            for (Ability a in abilities!)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      a.ability?.name?.capitalize() ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}
