import 'package:event_booker/BO/EventBO.dart';
import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event_booker/Helpers/NavigationHelper/Routes.dart';
import 'package:event_booker/Pages/MainPage/MainPageModel.dart';

// create a class named MainPageVM by extending the class MainPageModel.
class MainPageVM extends MainPageModel {

  /* Create a constructor method and assing valeues to the list named  collectionOfCategories and eventDetails*/
  MainPageVM(){

    // Assign values to list named collectionOfCategories.
    collectionOfCategories = ['Sports', 'Music', 'Food', 'Art'];

    // Assign values to list named eventDetails.
    eventDetails = [
    EventBO(
      imageLoaction: 'lib/Helpers/Resources/Asset/Images/image1.png',
      eventName: 'International Band Music Concert',
      dateMonthYear: '14 December, 2021',
      dayTime: 'Tuesday, 4:00PM - 9:00PM',
      location: 'Gala Convention Center',
      address: '36 Guild Street London, UK ',
      name: 'Ashfak Sayem',
      organizerType: 'Organizer',
      aboutEvent:
          'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
      bookMarked: true,
    ),
    EventBO(
      imageLoaction: 'lib/Helpers/Resources/Asset/Images/image2.png',
      eventName: "Jo Malone London's Mount's Music event",
      dateMonthYear: '31 December, 2021',
      dayTime: 'Tuesday, 4:00PM - 9:00PM',
      location: 'Music Convention Center',
      address: 'Radius Gallery • Santa Cruz, CA',
      name: 'Bob marley',
      organizerType: 'Organizer',
      aboutEvent:
          'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...',
      bookMarked: false,
    ),
  ];
  }
  
  /* Create a method named  navigateToEventDetailsPage of type void and set index as a named parameter */
  void navigateToEventDetailsPage({required int index}) {
    
    // Using the navigationStream stream controller add the NavigatorPush event by passing value for required named parameter.
    navigationStream.add(NavigatorPush(
        pageConfig: Pages.secondScreenConfig, data: eventDetails[index]));
  }
}
