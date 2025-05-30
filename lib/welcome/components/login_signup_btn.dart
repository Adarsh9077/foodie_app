import 'package:flutter/material.dart';
import 'package:foodie/login/login_screen.dart';
import 'package:foodie/signup/signup_screen.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              "Login".toUpperCase(),
              style: mTextStyle20(
                fontWeight: FontWeight.w800,
                txtColor: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        Hero(
          tag: "signup_btn",
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryLightColor,
              elevation: 0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
            child: Text(
              "Sign Up".toUpperCase(),
              style: mTextStyle20(
                fontWeight: FontWeight.w800,
                txtColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
