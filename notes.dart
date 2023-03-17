/*

CHEAT CODE : Add the User Freezed form the old project 

App State Setup
- Setup AppState Freezed :  AppState is the global state of the app
- Initialized Store on void main()
    - actionObservers: checking the action triggered
    - StoreProvider to declare our AppState  and our initial widget
    - All widgets has a an access on store or the provider 

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
