import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class SignUpSecond extends StatefulWidget {
  @override
  _SignUpSecondState createState() => _SignUpSecondState();
}

class _SignUpSecondState extends State<SignUpSecond> {
  bool checkvalue=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TopWidget(text: "Sign Up"),
              SizedBox(height: 40),
              TextWidget(
                text: "General Advice",
              ),
              SizedBox(height: 5),
              Container(
                  height: size.height * .18,
                  padding: EdgeInsets.all(8),
                  width: size.width * .90,
                  child: TextWidget(
                    text: "As in the sign up form",
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15))),
                      SizedBox(height: 5,),
              Container(
                  height: size.height * .18,
                  padding: EdgeInsets.all(8),
                  width: size.width * .90,
                  child: Column(children: [
                    NewTextWidget(text: "Financial Services Guide"),
                    SizedBox(height:30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .25,
                            text: "Read",
                            textSize: 12,
                            onPressed: () {}),
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .35,
                            text: "Download",
                            textSize: 12,
                            onPressed: () {}),
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .25,
                            text: "Email",
                            textSize: 12,
                            onPressed: () {}),
                      ],
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15))),

                      SizedBox(height: 5,),
                      Container(
                  height: size.height * .18,
                  padding: EdgeInsets.all(8),
                  width: size.width * .90,
                  child: Column(children: [
                    NewTextWidget(text: "Product Disclosure Statement"),
                    SizedBox(height:30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .25,
                            text: "Read",
                            textSize: 12,
                            onPressed: () {}),
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .35,
                            text: "Download",
                            textSize: 12,
                            onPressed: () {}),
                        ButtonWidget(
                            padding: EdgeInsets.all(2),
                            height: size.height * .05,
                            width: size.width * .25,
                            text: "Email",
                            textSize: 12,
                            onPressed: () {}),
                      ],
                    )
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Checkbox(value: checkvalue, onChanged: (bool value){
                  setState(() {
                    checkvalue=value;
                  });
                })   , 
                TextWidget(text: "I have read the PDS and FSG related to the scheme",)           ],
              ),
              SizedBox(height: 40),
              ButtonWidget(
                  width: size.width * .40, text: "Submit", onPressed: () {}),
            ]),
          ),
        ),
      ),
    );
  }
}
