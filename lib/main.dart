import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Features/Class.dart';
import 'package:school_management/Screens/HomePage.dart';
import 'package:school_management/Screens/LoginScreen.dart';
import 'package:school_management/Screens/RegistrationScreen.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Features/Admissions.dart';
import 'Screens/AllFeaturesScreen.dart';
import 'globals.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        fontFamily: kTextFont,
        primaryTextTheme: kTextTheme,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
        // Color(0xFFffff72),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,
        fontFamily: kTextFont,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
        primaryTextTheme: kTextTheme,
      ),
      initialRoute: "/",
      routes: {
        // "/": (context) => const HomePage(),
        "Login": (context) => const LoginScreen(),
        "Registration": (context) => const RegistrationScreen(),
        "FeatureScreen": (context) => const AllFeaturesScreen(),
        "AdmissionScreen": (context) => const AdmissionScreen(),
        "Classes": (context) => Classes(),
        "ClassInfo": (context) => ClassInfo(),
      },
      home: SplashScreen(
          seconds: 5,
          routeName: "/",
          navigateAfterSeconds: const AllFeaturesScreen(),
          title: const Text("Happy Learnings",
              style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          backgroundColor: kPrimaryColor,
          styleTextUnderTheLoader: const TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.white),
    );
  }
}

/*
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        // Color(0xFFffff72),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const HomePage(),
        "Login": (context) => const LoginScreen(),
        "Registration": (context) => const RegistrationScreen(),
        "FeatureScreen": (context) => const AllFeaturesScreen(),
        "AdmissionScreen": (context) => const AdmissionScreen(),
        "Classes": (context) => Classes(),
        "ClassInfo": (context) => ClassInfo(),
      },
    );
  }
}
*/
