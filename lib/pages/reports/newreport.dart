import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ReportMain extends StatefulWidget {
  @override
  _ReportMainState createState() => _ReportMainState();
}

class _ReportMainState extends State<ReportMain> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Reports"),
            SizedBox(height:40),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Financial Statement",onPressed: (){

                }),
                 ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Interest Statement", onPressed: (){

            }),
              ],
            ),
          SizedBox(height:40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Tax Statement", onPressed: (){
Navigator.pushNamed(context, "/tax-statement");
                }),
                 ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Rollover Amount", onPressed: (){
                   Navigator.pushNamed(context, "/roll-over");

            }),
              ],
            ),
           SizedBox(height:40),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Expenses Statement", onPressed: (){
  Navigator.pushNamed(context, "/expenses-statement");
                }),
                 ButtonWidget(width:size.width*.42,height:60, textAlign:TextAlign.center,text: "Gift Issued", onPressed: (){
                   Navigator.pushNamed(context, "/gift-statement");

            }),
              ],
            ),
            SizedBox(height:100),
          DashLogout()          ]),
        ),
        
        
      ),
    );
  }
}