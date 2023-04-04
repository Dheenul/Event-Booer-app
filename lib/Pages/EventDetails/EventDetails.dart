import 'package:event_booker/BO/EventBO.dart';
import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event_booker/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:event_booker/Pages/EventDetails/EventDetailsVM.dart';
import 'package:flutter/material.dart';

// Create a screen named MainPage using satateful widget
class EventDetails extends StatefulWidget {

  // Create a instance named data of type EventBO
  final EventBO data;

  /* In the constructor add a required named parameter and assing its data to the variable named data */
  const EventDetails({
    super.key,
    required this.data,
  });

  // Create state for the screen MainPage
  @override
  State<EventDetails> createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetails> {

  // Create an instance named _eventDetailsVM for the class EventDetailsVM and pass value widget.data for the named parameter data.
  late final EventDetailsVM _eventDetailsVM = EventDetailsVM(data: widget.data);

  @override
  void initState() {

    // Using Super keyword call the parent initState method.
    super.initState();

    // Listen to the stream using the stream controller named navigationStream.
    _eventDetailsVM.navigationStream.stream.listen((event) {

      // Check whether the listened event is equal to NavigatorPop
      if (event is NavigatorPop) {

        // Using context.pop() navigate to the prevoius page.
        context.pop();
      }
    });
  }
  
  @override
  void dispose() {

    // Using instance named _eventDetailsVM close the stream using .close() method.
    _eventDetailsVM.navigationStream.close();
   
    // call the parent dispose method.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {

              // Using the instance _eventDetailsVM call the method navigateToPreviousPage
              _eventDetailsVM.navigateToPreviousPage();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: SizedBox(
              height: 36,
              width: 36,

              // Using the instance check the value bookMarked in the instance named clickedEventData is false
              child: _eventDetailsVM.clickedEventData.bookMarked == false

                  // Build a Icon widget
                  ? const Icon(Icons.bookmark_outline_rounded,
                      color: Colors.black)

                  // Build an Icon widget.
                  : const Icon(Icons.bookmark, color: Colors.black),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
                image: AssetImage(
                    'lib/Helpers/Resources/Asset/Images/event1.png')),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [

                  // Build a Text widget using the value eventName of the instance clickedEventData using the instance _eventDetailsVM.
                  Text(
                    _eventDetailsVM.clickedEventData.eventName,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff120D26)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffeef0ff),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Image(
                                image: AssetImage(
                                    'lib/Helpers/Resources/Asset/Images/Calendar.png')),
                          )),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Build a Text widget using the value dateMonthYear of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.dateMonthYear,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff120D26)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Build a Text widget using the value dayTime of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.dayTime,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff747688)),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffeef0ff),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Image(
                                image: AssetImage(
                                    'lib/Helpers/Resources/Asset/Images/Location.png')),
                          )),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Build a Text widget using the value location of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.location,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff120D26)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Build a Text widget using the value address of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.address,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff747688)),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'lib/Helpers/Resources/Asset/Images/organizer.png')),
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffeef0ff),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Build a Text widget using the value name of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff120D26)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Build a Text widget using the value organizerType of the instance clickedEventData using the instance _eventDetailsVM.
                          Text(
                            _eventDetailsVM.clickedEventData.organizerType,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff747688)),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 110,
                      ),
                      Container(
                        height: 28,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color(0xffeef0ff)),
                        child: const Center(
                            child: Text(
                          'Follow',
                          style:
                              TextStyle(color: Color(0xff5669FF), fontSize: 12),
                        )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About Event',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color:  Color(0xff120D26)),
                      )),
                  const SizedBox(
                    height: 20,
                  ),

                  // Build a Text widget using the value aboutEvent of the instance clickedEventData using the instance _eventDetailsVM.
                  Text(_eventDetailsVM.clickedEventData.aboutEvent,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff120D26),
                          height: 1.7))
                ],
              ),
            )
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xff5669FF),
          onPressed: () {

            // Using the instance _eventDetailsVM call the method named navigateToPreviousPage.
            _eventDetailsVM.navigateToPreviousPage();
          },
          label: Row(
            children: [
              const Text('Buy Ticket \$120'),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.arrow_circle_right_outlined)
            ],
          )
        
          ),
    ));
  }
}
