import 'package:flutter/material.dart';
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
            onPressed: () {},
            child: Text(
              "Login".toUpperCase(),
              style: mTextStyle26(
                fontWeight: FontWeight.w700,
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
            onPressed: () {},
            child: Text(
              "Sign Up".toUpperCase(),
              style: mTextStyle26(
                fontWeight: FontWeight.w700,
                txtColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
