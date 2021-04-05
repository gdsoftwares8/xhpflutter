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
                      width: size.width * .30, labelText: "First Name"),
                  BoxTextFormWidgett(
                      width: size.width * .30, labelText: "Middle Name"),
                  BoxTextFormWidgett(
                      width: size.width * .30, labelText: "Last Name"),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(width: size.width * .30, labelText: "DOB"),
                  BoxTextFormWidgett(
                      width: size.width * .30, labelText: "Mobile"),
                  BoxTextFormWidgett(
                      width: size.width * .30, labelText: "Email"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      labelText: "Enter Transaction Pin"),
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      labelText: "Re-Enter Transaction Pin"),
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
                  width: size.width * .40, labelText: "Enter User Name"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      labelText: "Enter Transaction Pin"),
                  BoxTextFormWidgett(
                      width: size.width * .40,
                      labelText: "Re-Enter Transaction Pin"),
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
