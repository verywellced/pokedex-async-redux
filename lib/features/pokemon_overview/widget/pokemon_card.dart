import 'package:dartx/dartx.dart';
import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/utilities/extensions/string_extensions.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetailsPage(context, pokemon.name),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: const AssetImage(cardTransparentPlaceholder),
              image: NetworkImage(pokemon.url.toPokemonImageUrl),
              width: cardImageSize,
            ),
            BodySmallText(text: pokemon.name.capitalize())
          ],
        ),
      ),
    );
  }
}

void _navigateToDetailsPage(BuildContext context, String pokemonName) => Navigator.pushNamed(
      context,
      PokemonDetailsConnector.routeName,
      arguments: DetailsArguments(pokemonName),
    );
