import 'package:event_booker/BO/EventBO.dart';
import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:mobx/mobx.dart';
part 'EventDetailsModel.g.dart';

// Create a class named EventDetailsModel.
class EventDetailsModel = _EventDetailsModelBase with _$EventDetailsModel;

abstract class _EventDetailsModelBase with Store, NavigationMixin {
  
  // Create a instance named clickedEventData of type EventBO.
  late EventBO clickedEventData;
}
