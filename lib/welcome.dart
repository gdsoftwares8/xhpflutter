import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

import 'elements/BannerCarousel.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GlobalWidgets.getToolbar(size.height * .10),
            SizedBox(height: 20),
            Container(height: size.height * .50, child: BannerCarouselWidget()),
            SizedBox(height: size.height * .10),
            ButtonWidget(
              text: "Login",
              width: size.width * .60,
              onPressed: () { Navigator.pushNamed(context, "/login"); },
            ),

            SizedBox(height: 20),
            ButtonWidget(
              text: "Sign Up",
              width: size.width * .60,
              onPressed: () {},
            ),
            SizedBox(height: 30),
            TextWidget(text: "Terms and Conditions | Privacy | FSG | PDS")
          ],
        ),
      ),
    );
  }
}
