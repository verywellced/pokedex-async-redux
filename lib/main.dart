import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_start/state/app_state.dart';
import 'package:pokedex_start/state/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
}
