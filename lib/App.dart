import 'package:flutter/material.dart';
import 'Helpers/NavigationHelper/NavigationHelper.dart';
import 'Helpers/NavigationHelper/Routes.dart';

// Create a class named App by extending the class  statelessWidget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    
    // return the widget named MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // Using onGenerateRoute fix the initial page that has to load while launching the app.
      onGenerateRoute:
          AppRoute(initialPage: Pages.homeScreenConfig, initialPageData: null)
              .onGenerateRoute,
    );
  }
}
