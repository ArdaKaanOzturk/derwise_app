import 'package:derwise_app/pages/Chat_Screen/modules/chat_page.dart';
import 'package:derwise_app/pages/home_page.dart';
import 'package:derwise_app/pages/login_page.dart';
import 'package:derwise_app/pages/onboarding_page.dart';
import 'package:derwise_app/pages/widgets/options_page.dart';
import 'package:derwise_app/pages/profile_page.dart';
import 'package:derwise_app/pages/setting_page.dart';
import 'package:derwise_app/pages/sign_up_page.dart';
import 'package:derwise_app/pages/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
