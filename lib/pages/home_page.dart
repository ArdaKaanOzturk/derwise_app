import 'package:derwise_app/pages/MenuScreens/derwisescape.dart';
import 'package:derwise_app/pages/MenuScreens/events.dart';
import 'package:derwise_app/pages/bottom_navigation.dart';
import 'package:derwise_app/pages/categories.dart';
import 'package:derwise_app/pages/leader_board.dart';
import 'package:derwise_app/pages/meetings.dart';
import 'package:derwise_app/pages/notification.dart';
import 'package:derwise_app/pages/recommend.dart';
import 'package:derwise_app/pages/recommendedCourses.dart';
import 'package:derwise_app/pages/toptutors.dart';
import 'package:derwise_app/pages/videochat.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        backgroundColor: DerwiseTheme.backgroundApp,
        elevation: 0,
        title: Text(
          "derwise",
          style: GoogleFonts.pacifico(
              fontSize: 25, color: DerwiseTheme.bottomBarSecondary),
        ),
        centerTitle: true,
        actions: const [NotificationIcon()],
      ),
      drawer: Drawer(
        child: Container(
          color: DerwiseTheme.backgroundApp,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  ImageConstant.logoImage,
                  width: 100,
                  height: 100,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text(
                  'Communities',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CommunityScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outlined),
                title: const Text(
                  'derwise Social',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.record_voice_over),
                title: const Text(
                  'derwise Scape',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScapeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: DerwiseTheme.waterBlue,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: const Icon(Icons.square_outlined)),
                            const SizedBox(height: 8),
                            const Text('Categories')
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: DerwiseTheme.waterBlue,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: const Icon(Icons.leaderboard_outlined)),
                            const SizedBox(height: 8),
                            const Text('Standings')
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CalendarPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: DerwiseTheme.waterBlue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child:
                                      const Icon(Icons.calendar_month_sharp)),
                              const SizedBox(height: 8),
                              const Text('Calendar'),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoChatPage()),
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: DerwiseTheme.waterBlue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: const Icon(Icons.videocam)),
                              const SizedBox(height: 8),
                              const Text('Meetings')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 5, left: 5),
                    child: Container(
                      width: 500,
                      height: 160,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: DerwiseTheme.waterBlue,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  "Are you having trouble understanding\n the subject? Find the best student\n who can explain the subject you\n don't understand.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Image.asset(
                                ImageConstant.workingGirl,
                                width: 80,
                                height: 80,
                              )
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              // Add your onPressed function here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Find Tutor',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Recommended Courses",
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  recommenCourses(),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Top Tutors",
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  toptutors(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Recommended for you",
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Recommended(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.notifications_none_outlined),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationsPage()));
      },
    );
  }
}
//
