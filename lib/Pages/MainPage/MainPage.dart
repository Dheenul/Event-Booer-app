import 'package:event_booker/Helpers/NavigationHelper/Mixin/NavigationMixin.dart';
import 'package:event_booker/Helpers/NavigationHelper/NavigationHelper.dart';
import 'package:event_booker/Helpers/NavigationHelper/Routes.dart';
import 'package:event_booker/Pages/MainPage/MainPageVM.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Create a screen named MainPage using satateful widget
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // Create state for the screen MainPage
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  // Create an instance named _mainPageVM for the class named MainPageVM
  final MainPageVM _mainPageVM = MainPageVM();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff4A43EC),
    ));

    // Call the parent initState method.
    super.initState();

    // Listen to the stream using the stream controller named navigationStream.
    _mainPageVM.navigationStream.stream.listen((event) {

      // Check whether the listened event is equal to NavigatorPush
      if (event is NavigatorPush) {

        // Using context.push() navigate to the next page by providing the page config details and required data.
        context.push(pageConfig: Pages.secondScreenConfig, data: event.data);
      }
    });
  }
  
  @override
  void dispose() {

    // Using instance named _mainPageVM close the stream using .close() method.
    _mainPageVM.dispose();

    // call the parent dispose method.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 180,
              width: 412,
              child: Stack(children: [
                Container(
                  height: 160,
                  width: 412,
                  decoration: const BoxDecoration(
                      color: Color(0xff4A43EC),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Image(
                              image: AssetImage(
                                  'lib/Helpers/Resources/Asset/Images/menu.png'),
                              height: 20,
                              width: 24,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Current Location',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                const Text(
                                  'New Yourk, USA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white24,
                              child: Icon(
                                Icons.notifications_none_sharp,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                  'lib/Helpers/Resources/Asset/Images/search.png'),
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 18,
                              width: 2,
                              color: Colors.white24,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Search...',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white24),
                            ),
                            const SizedBox(
                              width: 143,
                            ),
                            Container(
                                height: 32,
                                width: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Color(0xffA29EF0),
                                      child: Icon(
                                        Icons.filter_list_rounded,
                                        color: Color(0xff4A43EC),
                                        size: 18,
                                      ),
                                    ),
                                    const Text(
                                      'Filters',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 40,
                    width: 380,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,

                        // Iterate till the length of the list named collectionOfCategories
                        itemCount: _mainPageVM.collectionOfCategories.length,

                        // Using the item builder build the widget that is being returned.
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Chip(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 15, left: 15),
                              backgroundColor: _mainPageVM
                                          .collectionOfCategories[index] ==
                                      'Sports'
                                  ? const Color(0xffF0635A)
                                  : _mainPageVM.collectionOfCategories[index] ==
                                          'Music'
                                      ? const Color(0xffF59762)
                                      : _mainPageVM.collectionOfCategories[
                                                  index] ==
                                              'Food'
                                          ? const Color(0xff29D697)
                                          : const Color(0xff46CDFB),
                              label: _mainPageVM
                                          .collectionOfCategories[index] ==
                                      'Sports'
                                  ? Text(
                                      _mainPageVM.collectionOfCategories[index],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : _mainPageVM.collectionOfCategories[index] ==
                                          'Music'
                                      ? Text(
                                          _mainPageVM
                                              .collectionOfCategories[index],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : _mainPageVM.collectionOfCategories[
                                                  index] ==
                                              'Food'
                                          ? Text(
                                              _mainPageVM
                                                      .collectionOfCategories[
                                                  index],
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : Text(
                                              _mainPageVM
                                                      .collectionOfCategories[
                                                  index],
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                              avatar: _mainPageVM
                                          .collectionOfCategories[index] ==
                                      'Sports'
                                  ? const Image(
                                      image: AssetImage(
                                          'lib/Helpers/Resources/Asset/Images/sports.png'),
                                      height: 18,
                                      width: 18,
                                    )
                                  : _mainPageVM.collectionOfCategories[index] ==
                                          'Music'
                                      ? const Image(
                                          image: AssetImage(
                                              'lib/Helpers/Resources/Asset/Images/music.png'),
                                          height: 18,
                                          width: 18,
                                        )
                                      : _mainPageVM.collectionOfCategories[
                                                  index] ==
                                              'Food'
                                          ? const Image(
                                              image: AssetImage(
                                                  'lib/Helpers/Resources/Asset/Images/food.png'),
                                              height: 16,
                                              width: 16,
                                            )
                                          : const Image(
                                              image: AssetImage(
                                                  'lib/Helpers/Resources/Asset/Images/art.png'),
                                              height: 18,
                                              width: 18,
                                            ),
                            ),
                          );
                        }),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 21),
              child: Row(
                children: [
                  const Text(
                    'Upcoming Events',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 132,
                  ),
                  const Text(
                    'See All',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xff747688)),
                  ),
                  const Icon(Icons.arrow_right_rounded,
                      color: Color(0xff747688)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: SizedBox(
                height: 258,
                width: 380,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    // Iterate till the length of the list named eventDetails
                    itemCount: _mainPageVM.eventDetails.length,

                    // Using sperate builerd retrun the widget that you want to build between each widget.
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 16,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                            _mainPageVM.navigateToEventDetailsPage(index: index);
                          },
                          splashColor: Colors.blueGrey,
                          child: SizedBox(
                            width: 218,
                            height: 220,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child:
                                            // Build a image widget and using the insatnce assign the value imagelocation of the list eventDetails at the particular index.
                                            Image.asset(
                                          _mainPageVM.eventDetails[index]
                                              .imageLoaction,
                                          fit: BoxFit.contain,
                                          filterQuality: FilterQuality.high,
                                          cacheHeight: 121 * 2,
                                          cacheWidth: 218 * 2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white70,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              height: 45,
                                              width: 45,
                                              child: Column(
                                                children: const [
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    "10",
                                                    style: TextStyle(
                                                      color: Color(0xffF0635A),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    "June",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffF0635A),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: _mainPageVM
                                                            .eventDetails[index]
                                                            .bookMarked ==
                                                        true
                                                    ? const Icon(
                                                        Icons.bookmark_rounded,
                                                        color:
                                                            Color(0xffF0635A))
                                                    : const Icon(
                                                        Icons.bookmark_outline,
                                                        color:
                                                            Color(0xffF0635A)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Build a Text widget and using the insatnce assign the value eventName of the list eventDetails at the particular index.
                                      Text(
                                        _mainPageVM
                                            .eventDetails[index].eventName,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                'lib/Helpers/Resources/Asset/Images/person1.png'),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const CircleAvatar(
                                            radius: 12,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: AssetImage(
                                                'lib/Helpers/Resources/Asset/Images/person2.png'),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            "+20 Going",
                                            style: TextStyle(
                                                color: Color(0xff3F38DD),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xff716E90),
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

                                          // Build a image widget and using the insatnce assign the value address of the list eventDetails at the particular index.
                                          Text(
                                            _mainPageVM
                                                .eventDetails[index].address,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff716E90)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Container(
              height: 127,
              width: 328,
              decoration: BoxDecoration(
                  color: const Color(0xffd6feff),
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Invite your friends',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff120D26)),
                        ),
                        const Text(
                          'Get \$20 for tickets',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff484D70)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "INVITE",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff00F8FF))),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(
                          'lib/Helpers/Resources/Asset/Images/advrt.png'))
                ],
              ),
            )
          ],
        ),
      )),
    
    );
  }
}