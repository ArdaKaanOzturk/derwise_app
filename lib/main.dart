import 'package:derwise_app/controllers/authentication_controller.dart';
import 'package:derwise_app/pages/calendar.dart';
import 'package:derwise_app/pages/Chat_Screen/modules/chat_page.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/login_page.dart';
import 'package:derwise_app/pages/splashScreen.dart';
import 'package:derwise_app/pages/options_screen/options_page.dart';
import 'package:derwise_app/pages/profile_page.dart';
import 'package:derwise_app/AccountScreen/setting_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/sign_up_pages/sign_up_page.dart';
import 'package:derwise_app/pages/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

/*
main async {
WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) {
    Get.put(AuthenticationController());
  });
*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDwA-E-AdDzFxNm3rLm-ZHBhaz51bSNjXo",
          appId: "1:1084471869645:web:5b17e2d61db9b00cf7a984",
          messagingSenderId: "1084471869645",
          projectId: "derw-bfced"));

  runApp(const MyApp());

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
