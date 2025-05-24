import 'package:flutter/material.dart';
import 'package:foodie/components/background.dart';
import 'package:foodie/ui_helper/responsive.dart';
import 'package:foodie/welcome/components/login_signup_btn.dart';
import 'package:foodie/welcome/components/welcome_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            mobile: MobileWelcomeScreen(),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: WelcomeImage()),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 450, child: LoginAndSignupBtn()),
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
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WelcomeImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex: 8, child: LoginAndSignupBtn()),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
