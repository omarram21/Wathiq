import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:wathiq/constans.dart';
import 'package:wathiq/views/navbar/navbar.dart';
import 'package:wathiq/views/onboarding_page.dart';
import 'firebase_options.dart';

// import '../constans.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      // home: NavBar(),
      home: FirebaseAuth.instance.currentUser == null
          ? OnboardingPage()
          : NavBar(),
      // home: OnboardingPage(),
      // home: ChooseMethod(),
      // initialBinding: HomeBinding(),
    );
  }
}
