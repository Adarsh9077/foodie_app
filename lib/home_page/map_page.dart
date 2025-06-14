import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 83, 69, 164),
            Color.fromARGB(125, 66, 53, 165),
            Color.fromARGB(95, 75, 53, 165),
            Color.fromARGB(95, 121, 112, 159),
            Color.fromARGB(45, 70, 53, 165),
            Color(0xff6F35A5).withAlpha(30),
            Color(0xff6F35A5).withAlpha(25),
            Color(0xff6F35A5).withAlpha(10),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white, size: 22),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Map",
            style: mTextStyle24(
              txtColor: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Text(
                "Based on your loaction,\nhere are the nearest hostels:",
                style: mTextStyle22(
                  txtColor: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
