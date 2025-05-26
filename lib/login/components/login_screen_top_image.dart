import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Login".toUpperCase(),
          style: mTextStyle26(
            txtColor: kPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Spacer(),
            SizedBox(
              width: 300,
              height: 300,
              child: SvgPicture.asset("assets/icons/delivery.svg"),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
