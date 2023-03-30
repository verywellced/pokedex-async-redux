import 'dart:async';

import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_grid_view.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/search_bar.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:pokedex_start/widget/spacing.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemons,
    required this.filterPokemons,
    required this.clearSearchedPokemons,
    super.key,
  });

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) filterPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController _searchController;
  late bool isSearching;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _clearSearchedPokemonsOnDispose();
    _searchController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SearchBar(
              searchController: _searchController,
              onClear: _clearSearchedPokemons,
              onChanged: (val) => _onSearchTextChanged(val),
            ),
            const VerticalSpace(height: 20.0),
            Expanded(
              child: isSearching
                  ? PokemonGridView(pokemons: widget.searchedPokemons)
                  : widget.pokemons.when(
                      (data) => PokemonGridView(pokemons: data),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (errorMessage) {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString));
                        return const BodySmallText(text: errorMessageDefault);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearSearchedPokemons() {
    widget.clearSearchedPokemons;
    setState(() {
      _searchController.text = emptyString;
      isSearching = false;
    });
  }

  void _clearSearchedPokemonsOnDispose() {
    if (widget.searchedPokemons.isNotEmpty) widget.clearSearchedPokemons;
  }

  void _onSearchTextChanged(String queryText) {
    _debounceTimer = Timer(
      const Duration(milliseconds: 1000),
      () => setState(() {
        widget.filterPokemons(queryText);
        isSearching = true;
      }),
    );
  }
}

void _showErrorMessageSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(content: Text(errorMessage));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
