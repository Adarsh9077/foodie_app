import 'package:flutter/material.dart';
import 'package:foodie/components/already_have_an_account_acheck.dart';
import 'package:foodie/components/background.dart';
import 'package:foodie/signup/components/sign_up_top_image.dart';
import 'package:foodie/signup/components/signup_form.dart';
import 'package:foodie/signup/components/soical_sign_up.dart';
import 'package:foodie/ui_helper/responsive.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(mobile: MobileSignUpScreen(), desktop: Placeholder()),
      ),
    );
  }
} //54:20

class MobileSignUpScreen extends StatelessWidget {
  const MobileSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignUpScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(flex: 8, child: SignUpForm()),
            Spacer(),
          ],
        ),
        SocialSignUp()
      ],
    );
  }
}
