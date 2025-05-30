import 'package:flutter/material.dart';
import 'package:foodie/signup/components/or_divider.dart';
import 'package:foodie/signup/components/social_icon.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialIcon(iconSrc: "assets/icons/facebook.svg", press: () {}),
            SocialIcon(iconSrc: "assets/icons/twitter.svg", press: () {}),
            SocialIcon(iconSrc: "assets/icons/google-plus.svg", press: () {}),
          ],
        ),
      ],
    );
  }
}
