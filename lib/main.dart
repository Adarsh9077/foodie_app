import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/home_page/home_page.dart';
// import 'package:foodie/login/login_screen.dart';
// import 'package:foodie/splash_screen/splash_screen.dart';
// import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/welcome/welcome_screen.dart';
import 'package:foodie/widgets/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: StadiumBorder(),
            backgroundColor: kPrimaryColor,
            minimumSize: Size(double.infinity, 56),
            maximumSize: Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.all(defaultPadding),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: WelcomeScreen(),
      // home: SplashScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            print(userSnapshot.hasData.toString());
            return HomeScreen();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
