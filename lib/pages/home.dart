import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/utils/global_vars.dart';

import 'appointment/appointments.dart';
import 'gifts/gift.dart';
import 'invoices/invoice.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'reports/report.dart';
import 'settings.dart';

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
    return Scaffold(
      /*appBar: GlobalWidgets.getToolbarWithBack(
      onPressed: (){
            Navigator.pop(context);
      }),*/
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to XHP"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                savebool(false);
                Navigator.of(context).pushNamedAndRemoveUntil(
                      '/welcome', (Route<dynamic> route) => false,
                      );
              })
        ],
      ),
      body: _children[_currentIndex],
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
            icon: Icon(Icons.mail),
            label: 'Invoice',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Gift'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
