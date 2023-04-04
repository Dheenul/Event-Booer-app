import 'package:event_booker/Pages/EventDetails/EventDetails.dart';
import 'package:event_booker/Pages/MainPage/MainPage.dart';
import 'NavigationHelper.dart';

// Assing the list of page in the app inside the enum class named Routes.
enum Routes { MainPage, EventDetailsView }

class Pages {
  Object? data;

  // Create page configuration named as homeScreenConfig for the page named MainPage and assign value to the parameter named route and build.
  static final PageConfig homeScreenConfig = PageConfig(
    route: Routes.MainPage,
    build: (_) => const MainPage(),
  );
  
  // Create page configuration named as secondScreenConfig for the page named EventDetailsView and assign value to the parameter named route and build.
  static final PageConfig secondScreenConfig = PageConfig(
    route: Routes.EventDetailsView,
    build: (_) => EventDetails(data: secondScreenConfig.data,),
  );
}
