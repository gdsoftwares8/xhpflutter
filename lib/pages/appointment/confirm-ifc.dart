import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ConfirmIFC extends StatefulWidget {
  @override
  _ConfirmIFCState createState() => _ConfirmIFCState();
}

class _ConfirmIFCState extends State<ConfirmIFC> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Confirm IFC"),
           
            SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewTextWidget(width:size.width*.43,text: "Treatment Amount",),
                NewTextWidget(width:size.width*.43,text: "\$ 15000.00",),
              ],
            ),
              SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewTextWidget(width:size.width*.43,text: "Amount Due today",),
                NewTextWidget(width:size.width*.43,text: "\$ 1500.00",),
              ],
            ),
            SizedBox(height:30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewTextWidget(width:size.width*.43,text: "Amount Due today",),
                NewTextWidget(width:size.width*.43,text: "\$ 1500.00",),
              ],
            ),SizedBox(height:80),
             ButtonWidget(width:size.width*.40,text: "Confirm", onPressed: (){
               Navigator.of(context).pop();

                }),
SizedBox(height:60),
           DashLogout()
          ]),
        ),
        
        
      ),
    );
  }
}