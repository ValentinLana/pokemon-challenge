part of 'pokemon_detail_cubit.dart';

class PokemonDetailState extends Equatable {
  final bool isLoading;
  final String? error;
  final PokemonDetail? pokemonDetail;
  final Pokemon? pokemon;

  const PokemonDetailState({
    required this.isLoading,
    this.error,
    this.pokemonDetail,
    this.pokemon,
  });

  @override
  List<Object> get props => [];
}
