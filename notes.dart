/*

CHEAT CODE : Add the User Freezed form the old project 

App State Setup
- Setup AppState Freezed :  AppState is the global state of the app
- Initialized Store on void main()
    - actionObservers: checking the action triggered

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

-

*/
