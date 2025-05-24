import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/ui_helper/utils.dart';
import 'package:foodie/widgets/constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text("Welcome to Foodie",style: mTextStyle30(fontWeight: FontWeight.bold),),SizedBox(height: defaultPadding,),Row(children: [Spacer(),SizedBox(width: 300,height: 300,child: SvgPicture.asset("assets/icons/foodlogo.svg"),),Spacer()],),SizedBox(height: defaultPadding,)],);
  }
}
