import 'package:pokedex_start/utilities/constant.dart';

extension StringExtension on String {
  String get pokemonId => split('/')[6];
  String get toPokemonImageUrl => basedImageUrl.replaceFirst(indexKey, pokemonId);
}
