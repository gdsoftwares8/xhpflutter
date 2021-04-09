import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ManageProfile extends StatefulWidget {
  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TopWidget(text: "Manage Profile"),
              SizedBox(height: 25),
              ButtonWidget(
                  width: size.width * .60,
                  text: "Personal Settings",
                  onPressed: () {}),
              SizedBox(height: 16),
              ButtonWidget(
                  width: size.width * .60, text: "Add Members", onPressed: () {
                    Navigator.of(context).pushNamed("/secondary-member");
                  }),
              SizedBox(height: 16),
              ButtonWidget(
                  width: size.width * .60,
                  text: "Manage Contributions",
                  onPressed: () {}),
              SizedBox(height: 16),
              ButtonWidget(
                  width: size.width * .60, text: "Suspension", onPressed: () {}),
              SizedBox(height: 16),
              ButtonWidget(
                  width: size.width * .60, text: "Withdrawal", onPressed: () {}),
              SizedBox(height: 16),
            
            
              ButtonWidget(
                  width: size.width * .60, text: "Referral", onPressed: () {}),
            
             
              SizedBox(height: 16),
              ButtonWidget(
                  width: size.width * .60, text: "Account Cancellation", onPressed: () {}),
              
             
            ]),
          ),
        ),
      ),
    );
  }
}
