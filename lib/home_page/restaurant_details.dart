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
      body: MainScreen(index: index),
    );
  }
}

class MainScreen extends StatelessWidget {
  final int index;

  const MainScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 50),
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
      child: SingleChildScrollView(
        child: Column(children: [TopImage(index: index)]),
      ),
    );
  }
}

class TopImage extends StatefulWidget {
  final int index;

  const TopImage({super.key, required this.index});

  @override
  State<TopImage> createState() => _TopImageState();
}

class _TopImageState extends State<TopImage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: NetworkImage(restaurantList[widget.index].imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 28, color: Colors.white),
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite, size: 28, color: kPrimaryColor),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurantList[widget.index].title,
                  style: mTextStyle22(txtColor: Colors.white),
                ),
                Text(
                  restaurantList[widget.index].locations,
                  style: mTextStyle18(txtColor: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} // 53:45
