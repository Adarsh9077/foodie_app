import 'package:flutter/material.dart';
import 'package:foodie/components/already_have_an_account_acheck.dart';
import 'package:foodie/home_page/home_page.dart';
import 'package:foodie/signup/signup_screen.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/welcome/welcome_screen.dart';
import 'package:foodie/widgets/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  // TextEditingController passwordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSubmitted: (email) {},
            decoration: InputDecoration(
              hintText: 'Email ID',
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextField(
              obscureText: true,
              obscuringCharacter: "*",
              cursorColor: kPrimaryColor,
              textInputAction: TextInputAction.done,
              // controller: passwordInput,
              decoration: InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
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
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                "Login".toUpperCase(),
                style: mTextStyle20(
                  txtColor: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
