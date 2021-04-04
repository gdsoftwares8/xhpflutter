import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class AppointmentStatus extends StatefulWidget {
  @override
  _AppointmentStatusState createState() => _AppointmentStatusState();
}

class _AppointmentStatusState extends State<AppointmentStatus> {
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Appointment Status"),
            SizedBox(height:40),
            TextWidget(text: "Appointment for Peter Georg",),
            SizedBox(height:40),
            ButtonWidget(width:size.width*.60,text: "Appointment Status", onPressed: (){

            }),
          SizedBox(height:40),
            ButtonWidget(width:size.width*.60,text: "Reschedule Status", onPressed: (){

            }),SizedBox(height:40),
            ButtonWidget(width:size.width*.60,text: "Cancel Status", onPressed: (){

            }),SizedBox(height:40),
            ButtonWidget(width:size.width*.60,text: "Appointment History", onPressed: (){

            }),SizedBox(height:60),
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