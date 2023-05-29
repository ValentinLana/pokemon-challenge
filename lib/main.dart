import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/data/api/api_service.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/screens/pokemon_list/cubit/pokemon_cubit.dart';
import 'package:pokemon_challenge/screens/pokemon_list/screens/pokemon_list_screen.dart';

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<PokemonRepository>(PokemonRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonCubit(),
      child: MaterialApp(
        title: 'Pokémon Challenge',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const PokemonListScreen(),
      ),
    );
  }
}
