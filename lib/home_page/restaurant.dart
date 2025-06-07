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
            itemCount: restaurantList.length,
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
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: defaultPadding * 1.5,
    ),
    child: GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(defaultPadding),
        child: SizedBox(
          width: size.width / 1.1,
          height: size.height / 2.5,
          child: Column(
            children: [
              Container(
                height: size.height / 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding),
                    topRight: Radius.circular(defaultPadding),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(restaurantList[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: size.width / 1.2,
                height: size.height / 15,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurantList[index].title.toString(),
                      style: mTextStyle20(fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: size.height / 25,
                      width: size.width / 7,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          defaultPadding * 0.6,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        restaurantList[index].rating.toString(),
                        style: mTextStyle18(
                          txtColor: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width / 1.2,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurantList[index].locations.toString(),
                      style: mTextStyle14(txtColor: Colors.black),
                    ),
                    Text(
                      "${restaurantList[index].price} for one",
                      style: mTextStyle14(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
