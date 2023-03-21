import 'package:pokedex_start/api/api_client.dart';
import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/api/model/pokemon_ability.dart';
import 'package:pokedex_start/api/model/pokemon_details.dart';
import 'package:pokedex_start/api/model/pokemon_move.dart';
import 'package:pokedex_start/api/model/pokemon_stats.dart';

typedef Json = Map<String, dynamic>;

class PokemonApi {
  PokemonApi({
    required this.apiClient,
    required this.baseUri,
  });

  final ApiClient apiClient;
  final Uri baseUri;

  Future<List<Pokemon>> getPokemonList({
    required String offset,
    required String limit,
  }) async {
    final queryParameters = <String, dynamic>{};

    queryParameters['limit'] = limit;
    queryParameters['offset'] = offset;

    final uri = baseUri.replace(
        queryParameters: queryParameters, path: '${baseUri.path}/pokemon');

    return await apiClient.dio.getUri(uri).then((response) {
      return response.data['results']
          .map<Pokemon>((dynamic data) => Pokemon.fromJson(data as Json))
          .toList();
    });
  }

  Future<PokemonDetails> getPokemonDetails({
    required String pokemonId,
  }) async {
    final uri = baseUri.replace(path: '${baseUri.path}/pokemon/$pokemonId/');

    return await apiClient.dio.getUri(uri).then((response) {
      List<dynamic> jsonAbilities = response.data['abilities'];
      List<dynamic> jsonMoves = response.data['moves'];
      List<dynamic> jsonStats = response.data['stats'];
      int pokemonHeight = response.data['height'];
      int pokemonWeight = response.data['weight'];
      int pokemonBaseExperience = response.data['base_experience'];

      // Get the list of ability
      List<PokemonAbility> pokemonAbilityList = jsonAbilities
          .map<PokemonAbility>((dynamic ability) =>
              PokemonAbility.fromJson(ability['ability'] as Json))
          .toList();

      // Get the moves of pokemon
      List<PokemonMove> pokemonMoveList = jsonMoves
          .map<PokemonMove>(
              (dynamic moves) => PokemonMove.fromJson(moves['move'] as Json))
          .toList();

      // Get the stats of pokemon
      List<PokemonStats> pokemonStatList = jsonStats
          .map<PokemonStats>(
              (dynamic stats) => PokemonStats.fromJson(stats as Json))
          .toList();

      return PokemonDetails(
        height: pokemonHeight,
        weight: pokemonWeight,
        baseExperience: pokemonBaseExperience,
        abilityList: pokemonAbilityList,
        moveList: pokemonMoveList,
        statList: pokemonStatList,
      );
    });
  }
}
