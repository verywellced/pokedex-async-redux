import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/utilities/pokedex_theme.dart';
import 'package:pokedex_start/utilities/routes.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        theme: pokedexTheme,
      ),
    ),
  );
}
