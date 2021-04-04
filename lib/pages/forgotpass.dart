import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/blocs/ChuckLocalData.dart';

import 'package:xhp/models/user.dart';
import 'package:xhp/networking/ApiProvider.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/SharedPref.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/utils/httpUtils.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
 
  SharedPref sharedPref = SharedPref();
  String username = "";
  
  bool _loading = false;
  
  User currentuser;

 

 




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? GlobalFunc.ProgressBar()
          : SingleChildScrollView(
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
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Forgot Password ?",
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
                          // textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Email or Username',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    //color: Main.primaryColor,
                                    width: 2.5,
                                    style: BorderStyle.solid)),
                            prefixIcon: Icon(Icons.person_outline,
                                color: Theme.of(context).accentColor),
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (value) {
                            try {
                              username = value.trim();
                              //currentuser.username=username;
                            } catch (e) {
                              print(e);
                              username = value;
                            }
                          },
                        ),
                       

                        SizedBox(
                          height: 30.0,
                        ),
                        ButtonWidget(
                          text: "Submit",
                          width: 170,
                          onPressed: () {
                            
                            GlobalFunc.showToast("Changed Successfully. Please Login");
                            Navigator.of(context).pushReplacementNamed("/login");
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  updateLoadingState(bool loading) {
    setState(() {
      this._loading = loading;
    });
  }
}
