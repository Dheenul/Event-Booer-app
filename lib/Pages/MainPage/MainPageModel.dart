import 'package:event_booker/BO/EventBO.dart';
import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:mobx/mobx.dart';
part 'MainPageModel.g.dart';

// Create a class named MainPageModel
class MainPageModel = _MainPageModelBase with _$MainPageModel;

abstract class _MainPageModelBase with Store, NavigationMixin {

  // Create a empty list of type String named collectionOfCategories.
  List<String> collectionOfCategories = [];

  // Create a empty list of type EventBO named eventDetails.
  List<EventBO> eventDetails = [];
}
