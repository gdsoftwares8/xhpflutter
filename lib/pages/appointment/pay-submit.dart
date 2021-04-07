import 'package:flutter/material.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class PaySubmit extends StatefulWidget {
  @override
  _PaySubmitState createState() => _PaySubmitState();
}

class _PaySubmitState extends State<PaySubmit> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Pay / Submit Invoice"),
           
            SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewTextWidget(height:40,width:size.width*.70,text: "Preferred Partner Invoice",),
                
              ],
            ),
              SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                NewTextWidget(width:size.width*.43,text: "\$ 1500.00",height: 50,),
                ButtonWidget(width:size.width*.43,text: "Pay Now", onPressed: (){

                }),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.black,thickness: 2,),
            ),

            TextWidget(text:"To submit a non preferred partner invoice \nclick on non preferred partner invoice")
,            SizedBox(height:30),
             ButtonWidget(width:size.width*.75,text: "Non Preferred Parnter Invoice", onPressed: (){

                }),
            SizedBox(height:40),
                ButtonWidget(width:size.width*.75,text: "Show Invoice History", onPressed: (){

                }),
                SizedBox(height:40),
             ButtonWidget(width:size.width*.40,text: "Confirm", onPressed: (){

                }),
SizedBox(height:50),
           DashLogout()
          ]),
        ),
        
        
      ),
    );
  }
}