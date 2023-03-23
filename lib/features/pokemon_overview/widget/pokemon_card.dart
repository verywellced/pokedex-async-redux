import 'package:pokedex_start/utilities/constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInImage(
            placeholder: const AssetImage(
              cardTransparentPlaceholder,
            ),
            image: NetworkImage(imageUrl),
            width: cardImageSize,
          ),
          BodySmallText(text: name)
        ],
      ),
    );
  }
}
