import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class SignUpp extends StatefulWidget {
  @override
  _SignUppState createState() => _SignUppState();
}

class _SignUppState extends State<SignUpp> {
  String fName;
  String mName;
  String lName;
  String transPin;
  String retransPin;
  String mobile;
  String email;
  String username;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "First Name", onChanged: (value) {
                                fName = value;
                              },),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Middle Name", onChanged: (value) {
                                mName = value;
                              },),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Last Name",
                       onChanged: (value) {
                                lName = value;
                              },),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(width: size.width * .30, hintText: "DOB"),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Mobile", onChanged: (value) {
                                mobile = value;
                              },),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Email", onChanged: (value) {
                                email = value;
                              },),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Enter Transaction Pin", onChanged: (value) {
                                transPin = value;
                              },),
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Re-Enter Transaction Pin", onChanged: (value) {
                                retransPin = value;
                              }),
                ],
              ),
              SizedBox(height: 30),
              TextWidget(
                text:
                    "Transaction Pin is required to \nvalidate your instructions on the platform\nSelect a memorable 4 digit number",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              BoxTextFormWidgett(
                  width: size.width * .40, hintText: "Enter User Name", onChanged: (value) {
                                username = value;
                              }),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Enter Transaction Pin", onChanged: (value) {
                                transPin = value;
                              }),
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Re-Enter Transaction Pin", onChanged: (value) {
                                retransPin = value;
                              }),
                ],
              ),
              SizedBox(height: 30),
              TextWidget(
                text:
                    "Minimum of 6 characters, any combinatoin of characters must include the following, Upper Case, Lower Case, Number and Character",
                textAlign: TextAlign.center,
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
