import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

void main() {
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
          border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30))
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: kPrimaryColor),
        child: Center(child: Text("Hello World", style: mTextStyle30(fontWeight: FontWeight.w700))),
      ),
    );
  }
}
