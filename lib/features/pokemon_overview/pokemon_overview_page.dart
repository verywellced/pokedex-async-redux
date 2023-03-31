import 'dart:async';

import 'package:pokedex_start/api/model/pokemon.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/pokemon_grid_view.dart';
import 'package:pokedex_start/features/pokemon_overview/widget/search_bar.dart';
import 'package:pokedex_start/utilities/async.dart';
import 'package:pokedex_start/utilities/string_constant.dart';
import 'package:pokedex_start/widget/app_text.dart';
import 'package:pokedex_start/widget/spacing.dart';
import 'package:flutter/material.dart';

class PokemonOverviewPage<T> extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemons,
    required this.onSearchPokemons,
    required this.onClearSearchedPokemons,
    super.key,
  });

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback onClearSearchedPokemons;
  final ValueChanged<T> onSearchPokemons;

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

    _searchController = TextEditingController()..addListener(_onSearchPokemons);
    isSearching = false;
  }

  @override
  void dispose() {
    _onClearSearchedPokemons();
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
              onClearSearchText: _clearSearchedPokemons,
            ),
            const VerticalSpace(height: 20.0),
            Expanded(
              child: isSearching
                  ? PokemonGridView(
                      pokemons: widget.searchedPokemons,
                      isSearching: true,
                    )
                  : widget.pokemons.when(
                      (data) => PokemonGridView(pokemons: data),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (errorMessage) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) => _showErrorMessageSnackbar(context, errorMessage ?? emptyString),
                        );
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
    widget.onClearSearchedPokemons;
    _searchController.text = emptyString;
    setState(() => isSearching = false);
  }

  void _onClearSearchedPokemons() {
    if (widget.searchedPokemons.isNotEmpty) widget.onClearSearchedPokemons;
  }

  void _onSearchPokemons() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 1000), () => _searchPokemons());
  }

  void _searchPokemons() {
    widget.onSearchPokemons(_searchController.text);
    isSearching = true;
  }
}

void _showErrorMessageSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(content: Text(errorMessage));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
