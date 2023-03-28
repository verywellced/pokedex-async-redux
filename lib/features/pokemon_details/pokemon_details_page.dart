import 'package:pokedex_start/api/model/pokemon_details.dart';
import 'package:pokedex_start/features/pokemon_details/widgets/pokemon_details_view.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemonDetails,
    super.key,
  });

  final Async<PokemonDetails> pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokedexDetailPageTitle)),
      body: Center(
        child: pokemonDetails.when(
          (data) => PokemonDetailsView(pokemonDetails: data),
          loading: () => const CircularProgressIndicator(),
          error: (errorMessage) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString));
            return const BodySmallText(text: errorMessageDefault);
          },
        ),
      ),
    );
  }
}

void _showErrorMessageSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(content: Text(errorMessage));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
