import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign up".toUpperCase(),
          style: mTextStyle28(
            fontWeight: FontWeight.w800,
            txtColor: kPrimaryColor,
          ),
        ),
        SizedBox(height: defaultPadding),
        Row(
          children: [
            Spacer(),
            SizedBox(
              width: 300,
              height: 300,
              child: SvgPicture.asset("assets/icons/Eating.svg"),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
