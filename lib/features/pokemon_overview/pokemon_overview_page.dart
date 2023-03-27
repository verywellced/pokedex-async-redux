import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_grid_view.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    super.key,
    required this.pokemons,
  });

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    // void _showErrorMessageSnackbar(errorMessage) {
    //   final snackBar = SnackBar(
    //     backgroundColor: Colors.black,
    //     content: Text(
    //       '$errorMessage',
    //     ),
    //   );
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   });
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text(appName)),
        body: Center(
          child: pokemons.when(
            (data) => PokemonGridView(pokemons: data),
            loading: () => const CircularProgressIndicator(),
            error: (errorMessage) {
              return Text(errorMessage ?? '');
            },
          ),
        ),
      ),
    );
  }
}
