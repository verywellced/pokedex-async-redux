import 'package:dartx/dartx.dart';
import 'package:pokedex_start/api/model/ability.dart';
import 'package:pokedex_start/api/model/move.dart';
import 'package:pokedex_start/api/model/pokemon_details.dart';
import 'package:pokedex_start/api/model/stats.dart';
import 'package:pokedex_start/features/pokemon_details/widgets/detail_card.dart';
import 'package:pokedex_start/features/pokemon_details/widgets/stat_card.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:pokedex_start/widget/spacing.dart';
import 'package:flutter/material.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    super.key,
    required this.pokemonDetails,
  });

  final PokemonDetails pokemonDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailsCard(
            title: generalLabel,
            children: [
              BodySmallText(text: '$heightLabel ${pokemonDetails.height}'),
              BodySmallText(text: '$weightLabel ${pokemonDetails.weight}'),
              BodySmallText(text: '$basedExperiencedLabelLabel ${pokemonDetails.baseExperience}'),
            ],
          ),
          DetailsCard(
            title: abilitiesLabel,
            children: [
              for (Ability ability in pokemonDetails.abilityList)
                BodySmallText(text: ability.abilityDetails.name.capitalize()),
            ],
          ),
          DetailsCard(
            title: movesLabel,
            children: [
              for (Move move in pokemonDetails.moveList.take(movesLimit).toList())
                BodySmallText(text: move.moveDetails.name.capitalize()),
            ],
          ),
          const VerticalSpace(height: 10.0),
          const HeadlineSmallText(text: statsLabel),
          Wrap(
            children: [
              for (Stats stats in pokemonDetails.statList) StatCard(stats: stats),
            ],
          )
        ],
      ),
    );
  }
}
