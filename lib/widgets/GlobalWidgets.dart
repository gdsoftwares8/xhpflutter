
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/text_widget.dart';

class GlobalWidgets {

  static Widget getToolbar(double height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
      ),
    );
  }

  static Widget getToolbarWithBack({title, @required onPressed}) {
    return AppBar(
        elevation: 5,
        centerTitle: true,
        title: TextWidget(text: (title!=null) ? title : "Welcome to XHP",
          color: Colors.white,
        textSize: 20,),
        leading: IconButton(
            icon:  Icon(
              Icons.arrow_back,
              color: Colors.white,

            ),
            onPressed: onPressed
        )

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