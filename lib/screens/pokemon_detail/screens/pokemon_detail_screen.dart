import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/data/models/pokemon.dart';
import 'package:pokemon_challenge/data/models/pokemon_detail.dart';
import 'package:pokemon_challenge/common/screens/error_screen.dart';
import 'package:pokemon_challenge/screens/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon_challenge/screens/pokemon_detail/widgets/pokemon_detail_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => PokemonDetailCubit(pokemon),
        child: const DetailBody(),
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.error
                ? const ErrorScreen()
                : GeneralInfo(pokemonDetail: state.pokemonDetail!);
      },
    );
  }
}

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({Key? key, required this.pokemonDetail}) : super(key: key);

  final PokemonDetail pokemonDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 100),
          PokemonDetailCard(
            pokemonDetail: pokemonDetail,
          ),
        ],
      ),
    );
  }
}
