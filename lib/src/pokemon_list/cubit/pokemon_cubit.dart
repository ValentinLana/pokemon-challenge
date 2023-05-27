import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/api/pokemon_api.dart';
import 'package:pokemon_challenge/src/pokemon_list/models/pokemon.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit()
      : super(
          const PokemonState(
              isLoading: true, error: false, filteredPokemonList: []),
        ) {
    /*  controller = ScrollController()..addListener(_scrollListener); */
    _getPokemonList();
  }

  List<Pokemon> pokemonList = [];
  List<Pokemon> filteredPokemonList = [];
  List<Pokemon> selectedPokemon = [];
  bool loading = false;

  @override
  Future<void> close() {
    /* controller!.removeListener(_scrollListener); */
    return super.close();
  }

  void _getPokemonList() async {
    try {
      pokemonList.addAll(await PokemonApi().getPokemonList());
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

    emit(PokemonState(
      isLoading: false,
      error: false,
      filteredPokemonList: filteredPokemonList,
    ));
  }

  void getNewPokemon() async {
    loading = true;

    List<Pokemon> newPokemons = await PokemonApi().getPokemonList();

    pokemonList = [...pokemonList, ...newPokemons];
    filteredPokemonList = pokemonList;

    emit(PokemonState(
      isLoading: false,
      error: false,
      filteredPokemonList: filteredPokemonList,
    ));

    loading = false;
  }

  /*  void _scrollListener() async {
    if (controller!.position.extentAfter == 0) {
      if (!loading && (filteredPokemonList.length == pokemonList.length)) {
        getNewPokemon();
      }
    }
  } */
}
