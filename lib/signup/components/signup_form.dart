import 'package:flutter/material.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          cursorColor: kPrimaryColor,
          onSubmitted: (email) {},
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Icon(Icons.person_rounded),
            ),
            hintText: "Email ID",
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: TextField(
            obscureText: true,
            obscuringCharacter: "*",
            cursorColor: kPrimaryColor,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: "Your Password",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.lock),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
        Hero(
          tag: "signup_btn",
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Sign Up".toUpperCase(),
              style: mTextStyle20(
                txtColor: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
