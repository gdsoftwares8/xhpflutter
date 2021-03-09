import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/models/User.dart';

import 'SharedPref.dart';
import 'global_vars.dart';

class GlobalFunc {

  static showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
  
  static log(String msg) {
    log(msg);
  }

  static moveuserAccordingLoginState(User muser, BuildContext context, SharedPref sharedPref) async {
    if(muser!=null){
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool(GlobalVars.isLogin, muser.isVerified ? true : false);
      prefs.setBool(GlobalVars.isVerified, muser.isVerified);
      if(muser.id!=null && muser.id.isNotEmpty)
        prefs.setString(GlobalVars.id, muser.id);
      prefs.setString(GlobalVars.name, muser.name);
      prefs.setString(GlobalVars.email, muser.email);

      try {
        sharedPref.save(GlobalVars.user, muser.toJson());
      } catch (e) {
        print(e);
      }
      if(!muser.isVerified)
        Navigator.pushNamedAndRemoveUntil(context, '/help_screen', (r) => false);
      else
        Navigator.pushNamedAndRemoveUntil(context, '/menu', (r) => false);
    } else {
      GlobalFunc.showToast("Error in retrive data");
    }
  }

  static Widget ProgressBar() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: GlobalVars.primaryColor,
      ),
    );
  }

  static Widget getDivider(Color mcolor) {
    return Container(
      margin: EdgeInsets.only(left: 32, right: 20),
      height: 1.2,
      decoration: BoxDecoration(
          color: mcolor
      ),
    );
    /* return Divider(
      thickness: 1.2,
      color: mcolor,
    );*/
  }

  static Widget getAnimatoreButton(Function click) {
    return GestureDetector(
      onTap: click,
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 30.0,maxHeight: 40.0),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black45,
                offset: const Offset(
                  2.0,
                  3.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
            ],
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF7B52AB).withOpacity(0.85),
                Color(0xFF522B83).withOpacity(0.85),
              ],
              //  stops: [0.0, 0.6],
            ),
            borderRadius: BorderRadius.circular(80.0)),
        child: Container(

          alignment: Alignment.center,
          child: Text(
            "ANIMATORE",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
                fontSize: 15,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  static LinearGradient getLinearGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: GlobalVars.gradientColors,
      stops: GlobalVars.gradientStops,
    );
  }
  static Widget getCircleText(String text, Color mcolor, bool isSelected, Function click) {
    return GestureDetector(
      onTap: click,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(0.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GlobalFunc.colorFromHex('#a9a8a8'),
        ),
        child: CircleAvatar(
          radius: 63,
          backgroundColor: isSelected ? Colors.green : GlobalFunc.colorFromHex('#522B83'),
          child: Text(
            '${text}',
            style: TextStyle(color: Colors.white,
              fontSize: 18,
              fontFamily: 'Montserrat_SemiBold', ),
          ),
        ),
      ),
    );
  }

  static Widget noDataWidget(String msg) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            msg,
            style: TextStyle(
                color: GlobalVars.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }


  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static Widget titleWidget(fontFamily, title, size, color) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: size,
            color: color,
            fontFamily: fontFamily),
      ),
    );
  }

  static Widget boldtitleWidget(fontFamily, String title, size, color) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            fontFamily: fontFamily),
      ),
    );
  }

  static Widget appBarGradient() {
    return new Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.8, 1.2],
            colors: [
              GlobalFunc.colorFromHex('#F1E7FC'),
              GlobalFunc.colorFromHex('#FBF8FE')
            ],
          )),
    );
  }

  static Future<PermissionStatus> getPermission() async {
    final PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.storage].request();
      return permissionStatus[Permission.storage] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }


  static void finish(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }

}
