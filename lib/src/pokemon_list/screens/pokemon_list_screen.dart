import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/src/common/screens/error_screen.dart';
import 'package:pokemon_challenge/src/common/widgets/circular_progress_indicator.dart';
import 'package:pokemon_challenge/src/pokemon_detail/screens/pokemon_detail_screen.dart';
import 'package:pokemon_challenge/src/pokemon_list/cubit/pokemon_cubit.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({Key? key}) : super(key: key);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokémon Challenge',
              style: TextStyle(color: Colors.black)),
          backgroundColor: const Color.fromARGB(255, 167, 247, 156),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Pokemon...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _searchController.clear();
                      BlocProvider.of<PokemonCubit>(context)
                          .filterPokemon(_searchController.text);
                    },
                  ),
                ),
                onChanged: (text) =>
                    BlocProvider.of<PokemonCubit>(context).filterPokemon(text),
              ),
            ),
            const BodyList(),
          ],
        ),
      ),
    );
  }
}

class BodyList extends StatelessWidget {
  const BodyList({Key? key}) : super(key: key);

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
                      ? const ListTile(
                          title: Text('El pokémon no existe'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.filteredPokemonList.length,
                          itemBuilder: (context, index) {
                            final pokemon = state.filteredPokemonList[index];
                            return ListTile(
                              leading: Image.network(
                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id}.png',
                                width: 50.0,
                                height: 50.0,
                              ),
                              title: Text(pokemon.name),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PokemonDetailScreen(pokemon),
                                ),
                              ),
                            );
                          },
                        );
        },
      ),
    );
  }
}
