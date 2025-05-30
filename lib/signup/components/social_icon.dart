import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/widgets/constants.dart';

class SocialIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;

  const SocialIcon({super.key, this.iconSrc, this.press});

  Widget build(BuildContext context) {
    return GestureDetector(onTap: press as void Function()?,child: Container(margin: EdgeInsets.symmetric(horizontal: 10),padding: EdgeInsets.all(defaultPadding),decoration: BoxDecoration(border: Border.all(width: 2,color: kPrimaryLightColor),shape: BoxShape.circle),child: SvgPicture.asset(iconSrc!,height: 20,width: 20,),),);
  }
}
