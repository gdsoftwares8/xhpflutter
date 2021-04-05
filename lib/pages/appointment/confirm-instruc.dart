import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ConfirmInstruc extends StatefulWidget {
  @override
  _ConfirmInstrucState createState() => _ConfirmInstrucState();
}

class _ConfirmInstrucState extends State<ConfirmInstruc> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Confirm Your \nInstructions"),
           
            SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewTextWidget(width:size.width*.43,text: "Enter your T pin",),
                BoxTextFormWidget(height: 35,hintText: "1234",)
              ],
            ),
              SizedBox(height:40),
            
            SizedBox(height:30),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(width:size.width*.43,text: "Enter OTP", fontWeight: FontWeight.bold,textAlign: TextAlign.center,), SizedBox(height:30),
                NewTextWidget(width:size.width*.43,text: "\$ 1500.00",),
              ],
            ),SizedBox(height:100),
             ButtonWidget(width:size.width*.40,text: "Confirm", onPressed: (){

                }),
SizedBox(height:60),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(width:size.width*.40,text: "Dashboard", onPressed: (){

                }),
                ButtonWidget(width:size.width*.40,text: "Logout", onPressed: (){

                }),
              ],
            )
          ]),
        ),
        
        
      ),
    );
  }
}