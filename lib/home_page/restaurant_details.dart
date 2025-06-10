import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class RestaurantDetails extends StatelessWidget {
  final int index;

  const RestaurantDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 50,
          // width: 100,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withAlpha(25),
                offset: Offset(0, 10),
                blurRadius: 50,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Order Now",
                style: mTextStyle20(
                  txtColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container();
  }
} //40:10
