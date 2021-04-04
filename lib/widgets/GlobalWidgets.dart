import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/welcome.dart';
import 'package:xhp/widgets/text_widget.dart';

class GlobalWidgets {
  static Widget getToolbar(double height) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/app_icon.png'),
            Column(children: [
              SizedBox(height: 30),
              TextWidget(
                text: "Xtras Health Plan",
                textSize: 22,
                fontWeight: FontWeight.bold,
              ),
              //SizedBox(height: 5),
              TextWidget(text: "Your Health | Your Savings | Your Choice")
            ])
          ],
        ),
      ),
    );
  }

  static Widget getToolbarWithBack({title, @required onPressed}) {
    savebool(bool value) async {
      final pref = await SharedPreferences.getInstance();
      pref.setBool(GlobalVars.isLogin, value);
    }

    Widget handleClick(String value) {
      switch (value) {
        case 'Notification':
          return null;

          break;
        case 'Help':
          return null;

          break;
        case 'Logout':
          savebool(false);
          return Welcome();
          break;
      }
    }

    return AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {
                'Notifications',
                'Help',
                'Logout',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        elevation: 5,
        centerTitle: true,
        title: TextWidget(
          text: (title != null) ? title : "Welcome to XHP",
          color: Colors.white,
          textSize: 20,
        ),
        // leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back,
        //       color: Colors.white,
        //     ),
        //     onPressed: (){
              
              
        //     })
            );
  }

  static Widget getCircleAppIcon({double radious = 100}) {
    return CircleAvatar(
      backgroundColor: GlobalFunc.colorFromHex('#0066ff'),
      radius: radious,
      child: Image.asset('assets/app_icon.png'),
    );
  }
}
