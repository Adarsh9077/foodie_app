import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [MainHomePage()];
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 16,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
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
      child: SingleChildScrollView(child: Column(children: [])),
    );
  }
} //  22: 50 part 2

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
          style: mTextStyle14(
            txtColor: isSelected ? kPrimaryColor : Colors.grey,
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
    return Padding(
      padding: EdgeInsets.all(defaultPadding * 1.35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
} // 24: 30
