import 'package:derwise_app/pages/Chat_Screen/modules/chat_page.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/pages/search/components/search.dart';
import 'package:derwise_app/pages/options_screen/options_page.dart';
import 'package:derwise_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DerwiseTheme.bottomBarPrimary,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GNav(
            backgroundColor: DerwiseTheme.bottomBarPrimary,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: DerwiseTheme.waterBlue,
            gap: 8,
            padding: const EdgeInsets.all(15),
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()),
                  );
                },
                icon: Icons.search_rounded,
                text: ' Search',
              ),
              GButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
                icon: Icons.chat_bubble,
                text: ' Messages',
              ),
              GButton(
                  onPressed: () {
                    Get.to(OptionsPages());
                  },
                  icon: Icons.person_2,
                  text: 'Profile'),
            ]),
      ),
    );
  }
}
