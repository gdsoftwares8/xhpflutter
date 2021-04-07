import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  savebool(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(GlobalVars.isLogin, value);
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
              title: "Member Dashboard",
              onPressed: (){
                Navigator.pop(context);
              }),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [CircleAvatar(radius:50,child: Icon(Icons.person_outline,size: 60,),),
                   
                  Column(children:[
                    TextWidget(text:"Hello Peter Georg",textSize: 16,),
                    TextWidget(text: "Good Evening",textSize: 16)
                  ])],),
                   SizedBox(height:20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonWidget(height: 40,text: "Payment Due", onPressed: (){

                      }),
                       ButtonWidget(height: 40,text: "Otp Confirmation", onPressed: (){

                      }),
                    ],
                  )
                  ,SizedBox(height:20),
                  TextWidget(text: "Current Account Balance",),
                  SizedBox(height:5),
                  ButtonWidget(text: "\$154300.00",width: MediaQuery.of(context).size.width*.60, height: 60,onPressed: (){
                    
                  }),
                  SizedBox(height:20),
                   TextWidget(text: "What would you like to do today ?",),
                  SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ButtonWidget(textAlign: TextAlign.center,width:size.width*.42,height:60,text: "Book\nAppointment", onPressed: (){
                    Navigator.pushReplacementNamed(context, "/book-appointment");

                  }),
                  ButtonWidget(textAlign: TextAlign.center,width:size.width*.42,height:60,text: "Upcoming\nAppointment", onPressed: (){
                     Navigator.pushReplacementNamed(context, "/appointment-status");
                    
                  })
                ],), SizedBox(height:20),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  ButtonWidget(textAlign: TextAlign.center,width:size.width*.42,height:60,text: "Confirm \nIFC", onPressed: (){
                               Navigator.pushReplacementNamed(context, "/confirm-ifc");

                  }),
                  ButtonWidget(textAlign: TextAlign.center,width:size.width*.42,height:60,text: "Pay / Submit \nInvoice", onPressed: (){
                               Navigator.pushReplacementNamed(context, "/pay-submit");
                    
                  })
                ],),SizedBox(height:20),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  ButtonWidget(width:size.width*.42,height:60,text: "Report", onPressed: (){
                               Navigator.pushReplacementNamed(context, "/report");

                  }),
                  ButtonWidget(width:size.width*.42,height:60,text: "My Profile", onPressed: (){
                               Navigator.pushReplacementNamed(context, "/my-profile");
                    
                  })
                ],),SizedBox(height:20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  ButtonWidget(width:size.width*.42,height:60,text: "Account \nSettings", onPressed: (){

                  }),
                  ButtonWidget(width:size.width*.42,height:60,text: "Logout", onPressed: (){
                     savebool(false);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                        '/welcome', (Route<dynamic> route) => false,
                        );

                    
                  })
                ],)
              ]),
            )
                ]),
                
              ),
        
      ),
    );
  }
}