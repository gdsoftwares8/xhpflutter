
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/text_widget.dart';

class GlobalWidgets {

  static Widget getToolbar(double height) {
    return Container(
      height: height,
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
    );
  }

  static Widget getCircleAppIcon({double radious = 100}) {
    return CircleAvatar(
      backgroundColor: GlobalFunc.colorFromHex('#522B83'),
      radius: radious,
      child: Image.asset('assets/app_icon.png'),
    );
  }
}