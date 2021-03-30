import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/SharedPref.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), (){
      checkUserAndNavigate(context);
    });
    return new Scaffold(
        extendBodyBehindAppBar: true,
     //   backgroundColor: const Color(0xFF522B83),
        body: Center(
          child: GlobalWidgets.getCircleAppIcon(),
        )
    );
  }

   checkUserAndNavigate(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool(GlobalVars.isLogin);
      GlobalFunc.logPrint("isLogin $isLogin");

      if(isLogin!=null && isLogin == true)
            Navigator.popAndPushNamed(context, "/home");
          else
            Navigator.popAndPushNamed(context, "/welcome");
    } catch (e) {
      print(e);
      Navigator.popAndPushNamed(context, "/welcome");
    }
  }

}