import 'package:flutter/material.dart';
import 'package:foodie/home_page/profile.dart';
import 'package:foodie/home_page/restaurant.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    MainHomePage(),
    Restaurant(),
    MainHomePage(),
    ProfileScreen(),
  ];
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currIndex),
      bottomNavigationBar: BottomAppBar(
        height: 78,
        padding: EdgeInsets.symmetric(vertical: 5),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                text: "Home",
                icon: Icons.home,
                isSelected: _currIndex == 0,
                onTap: () {
                  setState(() {
                    _currIndex = 0;
                  });
                },
              ),
              IconBottomBar(
                text: "Restaurant",
                icon: Icons.restaurant,
                isSelected: _currIndex == 1,
                onTap: () {
                  setState(() {
                    _currIndex = 1;
                  });
                },
              ),
              IconBottomBar(
                text: "Map",
                icon: Icons.map,
                isSelected: _currIndex == 2,
                onTap: () {
                  setState(() {
                    _currIndex = 2;
                  });
                },
              ),
              IconBottomBar(
                text: "Profile",
                icon: Icons.person_rounded,
                isSelected: _currIndex == 3,
                onTap: () {
                  setState(() {
                    _currIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: defaultPadding * 2.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            SearchInputBar(),
            PromoCard(),
            Headline(),
            CardListView(),
            SubHeadline(),
            // CardListView(),
            MenuListView(),
            Container(
              padding: EdgeInsets.only(left: 6),
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.1,
              child: Text(
                "Eat What Make you happy",
                style: mTextStyle20(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: defaultPadding * 1.5,
                left: defaultPadding,
                right: defaultPadding,
              ),
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              child: GridView.builder(
                itemCount: foodItemList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(text: foodItemList[index].name,
                      imgUrl: foodItemList[index].imageUrl,
                      subTitle: "20 min away");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() onTap;

  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: isSelected ? kPrimaryColor : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? kPrimaryColor : Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding * 1.35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your\nFavorite Food",
              style: mTextStyle26(fontWeight: FontWeight.w700),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(25),
                    offset: Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.food_bank, size: 25, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInputBar extends StatelessWidget {
  const SearchInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: defaultPadding * 0.5,
        bottom: defaultPadding * 0.5,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withValues(alpha: .25),
            ),
          ],
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            hintStyle: mTextStyle16(txtColor: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 52, 120, 78), kPrimaryColor],
          ),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: .5,
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                fit: BoxFit.cover,
              ),
            ),
            Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Image.png?alt=media&token=8256c357-cf86-4f76-8c4d-4322d1ebc06c",
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(defaultPadding * 1.5),
                child: Text(
                  "Want some\nicecream?",
                  style: mTextStyle22(
                    txtColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Nearest Restaurants",
                style: mTextStyle20(fontWeight: FontWeight.w700),
              ),
              Text(
                "The best food close to you",
                style: mTextStyle16(
                  txtColor: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            "View All",
            style: mTextStyle16(
              txtColor: kPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class SubHeadline extends StatelessWidget {
  const SubHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Menu",
                style: mTextStyle20(fontWeight: FontWeight.w700),
              ),
              Text(
                "The best food for you",
                style: mTextStyle16(
                  txtColor: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            "View More",
            style: mTextStyle16(
              txtColor: kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: defaultPadding * 1.5,
      ),
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              text: "Chicken",
              imgUrl:
              "https://toppng.com/uploads/preview/fried-chicken-115400746154bqe3zcl5t.png",
              subTitle: "8 min away",
            ),
            Card(
              text: "Healthy",
              imgUrl:
              "https://previews.123rf.com/images/firstblood/firstblood1506/firstblood150600075/40973395-transparent-glass-bowl-with-greek-salad-isolated-on-white-background-top-view.jpg",
              subTitle: "12 min away",
            ),
            Card(
              text: "Pizza",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
              subTitle: "15 min away",
            ),
            Card(
              text: "Punjabi",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
              subTitle: "15 min away",
            ),
          ],
        ),
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: defaultPadding * 1.5,
      ),
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Card(
              text: "Vegan",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
              subTitle: "8 min away",
            ),
            Card(
              text: "Italian ",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Restaurant%20Image.png?alt=media&token=43509b4c-269e-4279-8c88-36dc9ed27a66",
              subTitle: "12 min away",
            ),
            Card(
              text: "South Indian",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
              subTitle: "15 min away",
            ),
            Card(
              text: "Punjabi",
              imgUrl:
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
              subTitle: "15 min away",
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imgUrl;
  final String subTitle;

  const Card({
    super.key,
    required this.text,
    required this.imgUrl,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: defaultPadding * 1.5,
        bottom: defaultPadding * 1.5,
      ),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(12, 26),
              spreadRadius: 0,
              blurRadius: 20,
              color: Colors.grey.shade100,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              imgUrl,
              height: 70,
              fit: BoxFit.cover,
              frameBuilder: (BuildContext context,
                  Widget child,
                  int? frame,
                  bool? wasSynchronouslyLoaded,) {
                if (wasSynchronouslyLoaded!) {
                  return child;
                } else {
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
              },
            ),
            Spacer(),
            Text(
              text,
              style: mTextStyle18(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(subTitle, style: mTextStyle14(txtColor: Colors.grey)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
} // 45:30 part 3
