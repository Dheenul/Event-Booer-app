
// Create a class named EventBO to get the details required for the event.
class EventBO {

  // Create a variable named imageLoaction of type String.
  String imageLoaction;

  // Create a variable named eventName of type String.
  String eventName;

  // Create a variable named dateMonthYear of type String.
  String dateMonthYear;

  // Create a variable named dayTime of type String.
  String dayTime;

  // Create a variable named location of type String.
  String location;

  // Create a variable named address of type String.
  String address;

  // Create a variable named name of type String.
  String name;

  // Create a variable named organizerType of type String.
  String organizerType;

  // Create a variable named aboutEvent of type String.
  String aboutEvent;

  // Create a variable named bookMarked of type String.
  bool bookMarked;

  /* Create a constructor method with all the member of the calss EventBO as a required named parameters */
  EventBO(
      {
      required this.imageLoaction,
      required this.eventName,
      required this.dateMonthYear,
      required this.dayTime,
      required this.location,
      required this.address,
      required this.name,
      required this.organizerType,
      required this.aboutEvent,
      required this.bookMarked});
}
