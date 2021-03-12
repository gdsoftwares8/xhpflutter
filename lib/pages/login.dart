import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:xhp/models/User.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/SharedPref.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/utils/httpUtils.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/button_widget.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  SharedPref sharedPref = SharedPref();
  String _email = "";
  String _password = "";
  bool _loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: _loading ? GlobalFunc.ProgressBar() :
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 80.0),
                  alignment: Alignment.topCenter,
                  /*decoration: BoxDecoration(
                    //color: Main.opacityColor,
                    image: DecorationImage(
                      image: AssetImage("assets/app_icon.png"),
                      colorFilter: ColorFilter.mode(
                          Colors.deepPurple.withOpacity(0.7), BlendMode.srcATop),
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GlobalWidgets.getCircleAppIcon(radious: 100),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              //color: Main.primaryColor,
                                width: 2.5,
                                style: BorderStyle.solid)),
                        hintText: 'E-mail*',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onChanged: (value) {
                        try {
                          _email = value.trim();
                        } catch (e) {
                          print(e);
                          _email = value;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              //color: Main.primaryColor,
                                width: 2.5,
                                style: BorderStyle.solid)),
                        hintText: 'Password*',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ButtonWidget(
                      text: "Login",
                      width: 170,
                      onPressed: () {
                        if (_email == "" || _email == null || !EmailValidator.validate(_email)) {
                          GlobalFunc.showToast(GlobalVars.ENTER_VALID_EMAIL);
                        } else if (_password == "" || _password == null) {
                          GlobalFunc.showToast(GlobalVars.ENTER_PASSWORD);
                        } else {
                          postData();
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        showPasswordRecovery();
                      },
                      child: Text(
                        "forgot password?",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            color: Color(0xFF222222)
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

  showPasswordRecovery() {
    String email = "";

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 180,
//              color: GlobalFunc.colorFromHex('#522B83'),
              decoration: new BoxDecoration(
                  color: GlobalFunc.colorFromHex('#522B83'),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 35),
                                        padding: EdgeInsets.only(top: 53.5),
                                        child: TextFormField(
                                          autofocus: true,
                                          maxLines: 1,
                                          maxLength: 20,
                                          validator: (val) => val.isEmpty
                                              ? GlobalVars.ENTER_VALID_EMAIL
                                              : null,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat_SemiBold',
                                          ),
                                          cursorColor: Colors.white,
                                          decoration: InputDecoration(
                                              counterText: "",
                                              hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(.5)),
                                              hintText:
                                              'E-mail*',
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: GlobalFunc
                                                          .colorFromHex(
                                                          '#B0C3B2'))),
                                              focusedBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: GlobalFunc
                                                          .colorFromHex(
                                                          '#B0C3B2')))),
                                          obscureText: false,
                                          onChanged: (text) {
                                            email = text.trim();
                                          },
                                        ),
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Cancel',
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                },
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Continue',
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () async {
                                  if (email == "" || email == null || !EmailValidator.validate(email)) {
                                    GlobalFunc.showToast(GlobalVars.ENTER_VALID_EMAIL);
                                    return;
                                  }
                                  postPasswordRecovery(email,context);
                                  // _CreatePlayList(playListName);
                                },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future postData() async {
    Map<String, dynamic> parameterData = Map();
    parameterData.putIfAbsent("email", () => _email);
    parameterData.putIfAbsent("password", () => _password);
    parameterData.putIfAbsent("firebaseInstanceID", () => "blank");
    if(Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      parameterData.putIfAbsent("deviceType", () => "android");
      parameterData.putIfAbsent("deviceName", () => "Android $manufacturer $model");
      parameterData.putIfAbsent("osVersion", () => "$sdkInt");
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      print('$systemName $version, $name $model');

      parameterData.putIfAbsent("deviceType", () => "ios");
      parameterData.putIfAbsent("deviceName", () => "$systemName $version, $name $model");
      parameterData.putIfAbsent("osVersion", () => "$version");
    }

    updateLoadingState(true);

    try {
      http.Response res = await HttpUtils.getClient().post(
          GlobalVars.LOGIN_URL,
          headers: HttpUtils.getHeaders(),
          body: jsonEncode(parameterData)); // post api call
      updateLoadingState(false);

      var json = jsonDecode(res.body);
      print(json);
      if (json['Status'] == 1) {
        User user = User.fromJson(json['Data']);
        //  GlobalFunc.moveuserAccordingLoginState(user, context, sharedPref);

        /* final prefs = await SharedPreferences.getInstance();
        prefs.setBool(GlobalVars.isLogin, true);
        sharedPref.save(GlobalVars.user, json['Data']);
        prefs.setString(GlobalVars.id, json['Data']['userID']);
        Navigator.pushNamedAndRemoveUntil(context, "/category", (route) => false);*/
      } else {
        GlobalFunc.showToast(json['Message']);
      }
    } on SocketException {
      updateLoadingState(false);
      GlobalFunc.showToast('No Internet connection 😑');
      return Future.error('No Internet connection 😑');
    } on FormatException {
      updateLoadingState(false);
      GlobalFunc.showToast('Bad response format 👎');
      return Future.error('Bad response format 👎');
    } on Exception {
      updateLoadingState(false);
      GlobalFunc.showToast('Unexpected error 😢');
      return Future.error('Unexpected error 😢');
    }
  }

  updateLoadingState(bool loading) {
    setState(() {
      this._loading = loading;
    });
  }

  Future postPasswordRecovery(String email, BuildContext context) async {
    Map<String, dynamic> parameterData = Map();
    parameterData.putIfAbsent("email", () => email);

    //updateLoadingState(true);

    try {
      http.Response res = await HttpUtils.getClient().post(
          GlobalVars.PASSWORD_RECOVERY_URL,
          headers: HttpUtils.getHeaders(),
          body: jsonEncode(parameterData)); // post api call
      //  updateLoadingState(false);

      var json = jsonDecode(res.body);
      print(json);
      if (json['Status'] == 1) {
        GlobalFunc.showToast(json['Message']);
        Navigator.of(context).pop();
      } else {
        GlobalFunc.showToast(json['Message']);
      }
    } on SocketException {
      updateLoadingState(false);
      GlobalFunc.showToast('No Internet connection 😑');
      return Future.error('No Internet connection 😑');
    } on FormatException {
      updateLoadingState(false);
      GlobalFunc.showToast('Bad response format 👎');
      return Future.error('Bad response format 👎');
    } on Exception {
      updateLoadingState(false);
      GlobalFunc.showToast('Unexpected error 😢');
      return Future.error('Unexpected error 😢');
    }
  }

}


