import 'package:flutter/material.dart';
import 'package:xhp/widgets/text_widget.dart';

class TopWidget extends StatelessWidget {

  String text;
   TopWidget({this.text});
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/app_icon.png'),
              Column(children: [
                SizedBox(height: 30),
                TextWidget(
                  text: text,
                  textSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                //SizedBox(height: 5),
                TextWidget(text: "Your Health | Your Savings | Your Choice")
              ])
            ],
          ),
        ),
      ),
    );
  }
}