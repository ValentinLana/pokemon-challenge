import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit()
      : super(
          const PokemonState(
              isLoading: true, error: false, filteredPokemonList: []),
        ) {
    _getPokemonList();
  }

  final PokemonRepository pokemonRepository =
      GetIt.instance<PokemonRepository>();

  List<Pokemon> pokemonList = [];
  List<Pokemon> filteredPokemonList = [];
  bool loading = false;

  void _getPokemonList() async {
    try {
      pokemonList.addAll(await pokemonRepository.getPokemons());
      filteredPokemonList = pokemonList;

      emit(PokemonState(
        isLoading: false,
        error: false,
        filteredPokemonList: filteredPokemonList,
      ));
    } catch (e) {
      emit(PokemonState(
        isLoading: false,
        error: true,
        filteredPokemonList: filteredPokemonList,
      ));
    }
  }

  void filterPokemon(String query) {
    filteredPokemonList = pokemonList
        .where((pokemon) =>
            pokemon.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(
      PokemonState(
        isLoading: false,
        error: false,
        filteredPokemonList: filteredPokemonList,
      ),
    );
  }
}
