import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/common/screens/error_screen.dart';
import 'package:pokemon_challenge/common/widgets/circular_progress_indicator.dart';
import 'package:pokemon_challenge/screens/pokemon_list/cubit/pokemon_cubit.dart';
import 'package:pokemon_challenge/screens/pokemon_list/widgets/pokemon_card.dart';
import 'package:pokemon_challenge/screens/pokemon_list/widgets/pokemon_search_input.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              'Pokémon Challenge',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: <Widget>[
            PokemonSearchInput(),
            const PokemonsList(),
          ],
        ),
      ),
    );
  }
}

class PokemonsList extends StatelessWidget {
  const PokemonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          return state.isLoading
              ? const LoadingProgressIndicator()
              : state.error
                  ? const ErrorScreen()
                  : state.filteredPokemonList.isEmpty
                      ? const ListTile(title: Text('El pokémon no existe'))
                      : PokemonGrid(pokemonList: state.filteredPokemonList);
        },
      ),
    );
  }
}

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({Key? key, required this.pokemonList}) : super(key: key);
  final List<Pokemon> pokemonList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: (1 / .8)),
      shrinkWrap: true,
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        final pokemon = pokemonList[index];
        return PokemonCard(pokemon: pokemon);
      },
    );
  }
}
