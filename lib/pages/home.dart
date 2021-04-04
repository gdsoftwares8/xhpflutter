import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DrawerWidget.dart';
import 'package:xhp/widgets/text_widget.dart';

import 'appointment/appointments.dart';
import 'gifts/gift.dart';
import 'invoices/invoice.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'reports/report.dart';

import 'settings/settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Appointment(),
    Invoice(),
    Gift(),
    Report(),
    Settings()
  ];

  savebool(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(GlobalVars.isLogin, value);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
            appBar: GlobalWidgets.getToolbarWithBack(
          
            onPressed: (){
              Navigator.pop(context);
              
            }),
        /*appBar: GlobalWidgets.getToolbarWithBack(
        onPressed: (){
              Navigator.pop(context);
        }),*/
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("Welcome to XHP"),
        //   actions: [
        //     IconButton(
        //         icon: Icon(Icons.exit_to_app),
        //         onPressed: () {
        //           savebool(false);
        //           Navigator.of(context).pushNamedAndRemoveUntil(
        //                 '/welcome', (Route<dynamic> route) => false,
        //                 );
        //         })
        //   ],
        // ),
        body: _children[_currentIndex],
        drawer: DrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: Colors.blue[900],
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue[900],
              icon: Icon(Icons.assignment),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign),
              label: 'Invoice',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Gift'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Report'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
   Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            // title: new TextWidget(text:'Are you sure?'),
            content: new TextWidget(text:'Do you want to exit the App?',textSize: 18,),
            actionsPadding: EdgeInsets.only(left:30,right: 30),
            actions: <Widget>[
              
               GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: TextWidget(
                  text:"Cancel",
                  color:GlobalVars.accentColor ,
                  textSize: 14,
                
                ),
              ),
              SizedBox(width:20),
              //SizedBox(width: MediaQuery.of(context).size.width*.35),
               GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: TextWidget(
                 text: "Exit",
                 textSize: 14,
                 color:GlobalVars.accentColor
                 
                  // style: TextStyle(
                  //     color: Theme.of(context).accentColor,
                  //     fontSize: 14.0,
                  //     fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}

