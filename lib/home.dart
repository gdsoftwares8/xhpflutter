import 'package:flutter/material.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

import 'elements/BannerCarousel.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            Container(
              height: size.height * .10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/app_icon.png'),
                  Column(children: [
                    SizedBox(height: 30),
                    TextWidget(
                      text: "Xtras Health Plan",
                      textSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    //SizedBox(height: 5),
                    TextWidget(text: "Your Health | Your Savings | Your Choice")
                  ])
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(height: size.height * .50, child: BannerCarouselWidget()),
            SizedBox(height: size.height * .10),
            Container(
              height: 50,
              width: size.width * .60,
              child: ButtonWidget(
                text: "Login",
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: size.width * .60,
              child: ButtonWidget(
                text: "Sign Up",
                onPressed: () {},
              ),
            ),
            SizedBox(height: 30),
            TextWidget(text: "Terms and Conditions | Privacy | FSG | PDS")
          ],
        ),
      ),
    );
  }
}
