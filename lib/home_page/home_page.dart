import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
