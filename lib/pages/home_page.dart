import 'package:derwise_app/pages/bottom_navigation.dart';
import 'package:derwise_app/pages/notification.dart';
import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:flutter/material.dart';

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
      leading: const MenuIcon(),
      title: Padding(
        padding: const EdgeInsets.only(left: 70,top: 12),
        child: Image.asset(
          ImageConstant.logoImage),
      ),
      actions: const [
        NotificationIcon()
      ],
    ),
    bottomNavigationBar: const BottomNavigation(),
    body: 
    SafeArea(
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 25),
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
                              child: const Icon(
                                Icons.square_outlined
                              )
                            ),
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
                            child: const Icon(
                              Icons.leaderboard_outlined
                            )
                          ),
                          const SizedBox(height: 8),
                          const Text('Standings')
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
                            child: const Icon(
                              Icons.calendar_month_sharp
                            )
                          ),
                          const SizedBox(height: 8),
                          const Text('Calendar')
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
                            child: const Icon(
                              Icons.videocam
                            )
                          ),
                          const SizedBox(height: 8),
                          const Text('Meetings')
                        ],
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
                     borderRadius: BorderRadius.all(Radius.circular(16))
                   ),
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
                      )
                      ,
                       const Spacer(),
                       ElevatedButton(
                         onPressed: () {
                           // Add your onPressed function here
                         },
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.white,
                           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

              ],
            ),
          ),
        ),
      ),
    ),
    );
  }



}


//AppBar
class MenuIcon extends StatelessWidget{
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
  }
}

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            )
            ),
          ),
        ]
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget{
  const NotificationIcon({super.key});

@override
Widget build(BuildContext context) {
  return IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {
              Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => NotificationsPage()
              )
             );
            },
          );
}
      
  }
//
