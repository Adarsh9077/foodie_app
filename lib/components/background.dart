import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String topImage, bottomImage;

  const Background({
    super.key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/main_bottom.png",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(topImage, width: 250),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
