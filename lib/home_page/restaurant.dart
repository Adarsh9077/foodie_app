import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

Widget restaurantAvailable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height,
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
  );
} // 10:40 part 3