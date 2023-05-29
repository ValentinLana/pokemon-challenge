import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/screens/pokemon_list/cubit/pokemon_cubit.dart';

class PokemonSearchInput extends StatelessWidget {
  PokemonSearchInput({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Pokemon...',
                border: InputBorder.none,
              ),
              onChanged: (text) =>
                  BlocProvider.of<PokemonCubit>(context).filterPokemon(text),
            ),
          ),
        ],
      ),
    );
  }
}
