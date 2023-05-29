part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  final bool isLoading;
  final bool error;
  final List<Pokemon> filteredPokemonList;

  const PokemonState({
    required this.isLoading,
    required this.error,
    required this.filteredPokemonList,
  });
  @override
  List<Object> get props => [isLoading, error, filteredPokemonList];
}
