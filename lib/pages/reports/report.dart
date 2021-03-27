import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/widgets/OtionTab.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Contribution",
                          icon: FontAwesomeIcons.fileInvoice,
                          onPressed: (){
                            Navigator.pushNamed(context, '/contributions');
                          }),
                      OptionTab(
                          tabText: "Financial\nStatement",
                          icon: FontAwesomeIcons.addressBook,
                          onPressed: (){
                            Navigator.pushNamed(context, '/financial');
                          }),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Appointment\nReport",
                          icon: FontAwesomeIcons.history,
                          onPressed: (){
                            Navigator.pushNamed(context, '/appointment-report');
                          }),
                      OptionTab(
                          tabText: "Expenses",
                          icon: FontAwesomeIcons.dollarSign,
                          onPressed: (){
                            //Navigator.pushNamed(context, '/non-partner');
                          }),
                    ],
                  ),
                                ])));
  }
}
