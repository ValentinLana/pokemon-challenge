import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/data/api/api_service.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail.dart';
import 'package:pokemon_challenge/data/models/response.dart';

class PokemonRepository {
  final ApiService _apiService = GetIt.instance<ApiService>();
  Future<List<Pokemon>> getPokemons() async {
    final Response response = await _apiService.get('?limit=1000&offset=0');
    if (response.isSuccess) {
      final List<Pokemon> pokemonList = response.data['results']!
          .map<Pokemon>((item) => Pokemon.fromJson(item))
          .toList();
      return pokemonList;
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }

  Future<PokemonDetail> getPokemonDetail(int pokemonId) async {
    final Response response = await _apiService.get('/$pokemonId');
    if (response.isSuccess) {
      final PokemonDetail pokemonDetail = PokemonDetail.fromJson(response.data);
      return pokemonDetail;
    } else {
      throw Exception('Failed to load Pokemon detail');
    }
  }
}
