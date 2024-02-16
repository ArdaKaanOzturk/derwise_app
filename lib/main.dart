import 'package:derwise_app/controllers/authentication_controller.dart';
import 'package:derwise_app/pages/calendar.dart';
import 'package:derwise_app/pages/Chat_Screen/modules/chat_page.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/login_page.dart';
import 'package:derwise_app/pages/onboarding_page.dart';
import 'package:derwise_app/pages/widgets/options_page.dart';
import 'package:derwise_app/pages/profile_page.dart';
import 'package:derwise_app/pages/setting_page.dart';
import 'package:derwise_app/pages/AuthenticationScreen/sign_up_page.dart';
import 'package:derwise_app/pages/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value)
  {
    Get.put(AuthenticationController());
  });

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {}),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const OnboardingScreen(),
      },
    );
  }
}
