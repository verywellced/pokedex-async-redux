import 'package:pokedex_start/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_start/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_start/utilities/pokedex_theme.dart';

void main() {
  final navigatorKey = GlobalKey<NavigatorState>();
  NavigateAction.setNavigatorKey(navigatorKey);
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        routes: routes,
        navigatorKey: navigatorKey,
        theme: getPokedexTheme(),
      ),
    ),
  );
}

final routes = {
  '/': (BuildContext context) => const PokemonOverviewConnector(),
  PokemonDetailsConnector.routeName: (BuildContext context) => const PokemonDetailsConnector()
};
