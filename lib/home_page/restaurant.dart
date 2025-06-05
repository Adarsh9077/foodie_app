import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: restaurantAvailable(context));
  }
}

Widget restaurantAvailable(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.only(top: defaultPadding * 3.25),
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
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding * 1.5,
            right: defaultPadding * 1.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Restaurants Near You",
                style: mTextStyle26(
                  txtColor: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return itemBuilder(size, context, index);
            },
          ),
        ),
      ],
    ),
  );
}

Widget itemBuilder(Size size, BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: defaultPadding),
    child: GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(defaultPadding),
        child: Container(),
      ),
    ),
  );
} // 19:30 part 3
