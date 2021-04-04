import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/utils/global_vars.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(child: 
       ListView(
      padding: EdgeInsets.only(right: 20, left: 20),
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          arrowColor: Colors.white,
          accountName:
              Text("Peter", style: TextStyle(color: Colors.black)),
          accountEmail:
              Text("peter@gmail.com", style: TextStyle(color: Colors.black)),
          currentAccountPicture: CircleAvatar(
            backgroundColor:
                Theme.of(context).platform == TargetPlatform.android
                    ? Color(0xFF0066FF)
                    : Colors.white,
            child:Icon(FontAwesomeIcons.user,color: Colors.white,)
          ),
        ),
        ListTile(
          title: Text('Current Balance'),
          leading: Icon(
            FontAwesomeIcons.dollarSign,
            color: GlobalVars.primaryColor,
          ),
          trailing:Container(child: Card(elevation:5,child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("4000.00"),
          ),),),
          onTap: () {
           
          },
        ),
        ListTile(
          title: Text('Booking Appointment'),
          leading: Icon(
            Icons.assignment,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Upcoming Appointment'),
          leading: Icon(
            FontAwesomeIcons.fileInvoice,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
          
          },
        ),
        ListTile(
          title: Text('Approve IFC'),
          leading: Icon(
            Icons.local_offer,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 2),
        ListTile(
          title: Text('Outstanding Invoice'),
          leading: Icon(
            Icons.file_present,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
           
          },
        ),
       
        SizedBox(height: 2),
        ListTile(
          title: Text('Report'),
          leading: Icon(
            Icons.bar_chart,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
           
          },
        ),
        ListTile(
          title: Text('About Us'),
          leading: Icon(
            Icons.question_answer,
            color: GlobalVars.primaryColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Sign out'),
          leading: Icon(
            Icons.exit_to_app,
            color: GlobalVars.primaryColor,
          ),
          onTap: () async {
           
          },
        ),
      ],
    ),);
  }
}
