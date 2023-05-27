import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/api/pokemon_api.dart';
import 'package:pokemon_challenge/src/pokemon_list/models/pokemon.dart';
import 'package:pokemon_challenge/src/pokemon_detail/models/pokemon_detail.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(this.pokemon)
      : super(const PokemonDetailState(isLoading: true)) {
    _getPokemonDetail();
  }

  Pokemon? pokemon;
  PokemonDetail? pokemonDetail;

  void _getPokemonDetail() async {
    try {
      pokemonDetail = await PokemonApi().getPokemonDetail(pokemon!.url);

      emit(
        PokemonDetailState(
          isLoading: false,
          pokemonDetail: pokemonDetail!,
          pokemon: pokemon!,
        ),
      );
    } catch (e) {
      emit(
        PokemonDetailState(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}
