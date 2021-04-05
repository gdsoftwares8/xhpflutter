import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
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
              TopWidget(text: "Payment Form"),
              SizedBox(height: 40),
              
              SizedBox(height: 5),
              Container(
                  height: size.height * .50,
                  padding: EdgeInsets.all(8),
                  width: size.width * .90,
                  child: TextWidget(
                    text: "Stripe Payment Form",
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15))),
                      SizedBox(height: 5,),
              
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
