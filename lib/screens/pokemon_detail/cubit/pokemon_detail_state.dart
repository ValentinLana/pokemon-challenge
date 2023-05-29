part of 'pokemon_detail_cubit.dart';

class PokemonDetailState extends Equatable {
  final bool isLoading;
  final bool error;
  final PokemonDetail? pokemonDetail;

  const PokemonDetailState({
    required this.isLoading,
    required this.error,
    required this.pokemonDetail,
  });

  @override
  List<Object> get props => [isLoading, error];
}
