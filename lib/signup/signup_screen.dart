import 'package:flutter/material.dart';
import 'package:foodie/components/background.dart';
import 'package:foodie/ui_helper/responsive.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(mobile: Placeholder(), desktop: Placeholder()),
      ),
    );
  }
}
