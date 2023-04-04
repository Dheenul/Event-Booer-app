import 'package:event_booker/BO/EventBO.dart';
import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event_booker/Pages/EventDetails/EventDetailsModel.dart';

class EventDetailsVM extends EventDetailsModel {

  /* Create a constructor method and set the instance named data of type EventBO as a required parameter.*/
  EventDetailsVM({required EventBO data}) {
    
    // Assign the value of the instance named data to the instance clickedEventData
    clickedEventData = data;
  }

  /* Create a method namePrevious of type void and set index as a named parameter */
  void navigateToPreviousPage() {
    
    // Using the navigationStream stream controller add the NavigatorPop event.
    navigationStream.add(NavigatorPop());
  }
}
