import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';

part 'pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(this.pokemon)
      : super(const PokemonDetailState(
            isLoading: true, error: false, pokemonDetail: null)) {
    _getPokemonDetail();
  }

  final PokemonRepository pokemonRepository =
      GetIt.instance<PokemonRepository>();
  Pokemon? pokemon;
  PokemonDetail? pokemonDetail;

  void _getPokemonDetail() async {
    try {
      pokemonDetail = await pokemonRepository.getPokemonDetail(pokemon!.id);

      emit(
        PokemonDetailState(
          isLoading: false,
          error: false,
          pokemonDetail: pokemonDetail!,
        ),
      );
    } catch (e) {
      emit(
        const PokemonDetailState(
          isLoading: false,
          error: true,
          pokemonDetail: null,
        ),
      );
    }
  }
}
