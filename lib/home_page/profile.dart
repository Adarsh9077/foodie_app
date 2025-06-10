import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            "Profile",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(LineAwesomeIcons.moon, color: Colors.white),
            ),
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 1.12,
              horizontal: defaultPadding * 1.5,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/images/profile.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Adarsh Bhardwaj",
                  style: mTextStyle26(
                    txtColor: Colors.grey.shade800,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "adarsh08janus.com",
                  style: mTextStyle16(
                    txtColor: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit Profile",
                      style: mTextStyle20(
                        txtColor: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Divider(color: Colors.grey[400], thickness: 2),
                SizedBox(height: 25),
                ProfileMenuWidget(
                  text: "Settings",
                  icon: LineAwesomeIcons.cog_solid,
                  press: () {},
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
    required this.color,
    this.endIcon = true,
  });

  final String text;
  final IconData icon;
  final VoidCallback press;
  final bool endIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Container(
        padding: EdgeInsets.all(10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Theme.of(context).primaryColorDark, size: 20),
      ),
      title: Text(
        text,
        style: mTextStyle18(txtColor: color, fontWeight: FontWeight.w600),
      ),
      trailing:
          endIcon
              ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  LineAwesomeIcons.angle_right_solid,
                  color: Colors.black,
                  size: 18,
                ),
              )
              : null,
    );
  }
} //21:20 part 4
