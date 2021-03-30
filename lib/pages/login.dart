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
import 'package:xhp/blocs/ChuckLogin.dart';
import 'package:xhp/models/login_response.dart';
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

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  ChuckLoginbloc _bloc;
  SharedPref sharedPref = SharedPref();
  String username = "";
  String _password = "";
  bool _loading = false;
  bool show_pass = false;
  User currentuser;

 savebool(bool value)async{
   final pref=await SharedPreferences.getInstance();
   pref.setBool(GlobalVars.isLogin, value);


 }


  listenStream() {
    _bloc.chuckListStream.listen((Response<LoginResponce> event) {
      
      GlobalFunc.logPrint("Login listen ${event.message}");
      switch(event.status) {
        case Status.LOADING:
          GlobalFunc.logPrint(event.message);
          updateLoadingState(true);
          break;
        case Status.COMPLETED:
          GlobalFunc.logPrint(" Success ${event.data}");
          updateLoadingState(false);
          if(event.data.userData!=null) {
            savebool(true);
            GlobalFunc.saveUserData(event.data.userData, context, sharedPref);
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
          } else {
            GlobalFunc.showToast("Error:- "+event.message);
          }
          break;
        case Status.ERROR:
          updateLoadingState(false);
          GlobalFunc.showToast(event.message);
          break;
      }

    }, onError: (error){
      print("Error $error");
    }, onDone: () {
      print("Stream closed!");
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = ChuckLoginbloc();
    listenStream();

  }

  @override
  void dispose() {
    _bloc.dispose(); //Streams must be closed when not needed
    super.dispose();
  }

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
                        
                         // textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            labelText: 'Username',
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
                          height: 20.0,
                        ),
                        TextField(
                          obscureText: !show_pass,
                          obscuringCharacter: "*",
                         
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(show_pass
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  show_pass = !show_pass;
                                });
                              },
                              color: Theme.of(context).focusColor,
                              
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    //color: Main.primaryColor,
                                    width: 2.5,
                                    style: BorderStyle.solid)),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: Theme.of(context).accentColor),
                            hintText: '••••••••••••',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onChanged: (value) {
                            _password = value;
                            // currentuser.password=_password;
                            // print("hkjhkhkjh"+currentuser.toString());

                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ButtonWidget(
                          text: "Login",
                          width: 170,
                          onPressed: () {
                            if (username == "" || username == null) {
                              GlobalFunc.showToast(
                                  GlobalVars.ENTER_VALID_EMAIL);
                            } else if (_password == "" || _password == null) {
                              GlobalFunc.showToast(GlobalVars.ENTER_PASSWORD);
                            } else {
                              //List<Map<String, dynamic>> map=[{'username':username,},{'password':_password}];
                             // _bloc.fetchLogin(username, _password);
                             _bloc.fetchLogin(username, _password);
                              // if (LoginResponce().status==1) {
                              //   print("DFGHBJN");
                              //   // Navigator.pushReplacementNamed(context, "/home");

                              // }
                              //ApiProvider().post(GlobalVars.LOGIN_URL);
                              // ApiProvider().post(url);
                              
                                  
                             // postData();
                            }
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        FlatButton(
                          onPressed: () {
                            //showPasswordRecovery();
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                                color: Color(0xFF222222)),
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

  updateLoadingState(bool loading) {
    setState(() {
      this._loading = loading;
    });
  }

}

//   showPasswordRecovery() {
//     String email = "";

//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: Container(
//               height: 180,
// //              color: GlobalFunc.colorFromHex('#522B83'),
//               decoration: new BoxDecoration(
//                   color: GlobalFunc.colorFromHex('#522B83'),
//                   borderRadius: BorderRadius.circular(20.0)),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Stack(
//                               children: <Widget>[
//                                 Positioned(
//                                   child: Align(
//                                       alignment: Alignment.center,
//                                       child: Container(
//                                         margin: EdgeInsets.only(left: 35),
//                                         padding: EdgeInsets.only(top: 53.5),
//                                         child: TextFormField(
//                                           autofocus: true,
//                                           maxLines: 1,
//                                           maxLength: 20,
//                                           validator: (val) => val.isEmpty
//                                               ? GlobalVars.ENTER_VALID_EMAIL
//                                               : null,
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Montserrat_SemiBold',
//                                           ),
//                                           cursorColor: Colors.white,
//                                           decoration: InputDecoration(
//                                               counterText: "",
//                                               hintStyle: TextStyle(
//                                                   color: Colors.white
//                                                       .withOpacity(.5)),
//                                               hintText: 'Username*',
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           color: GlobalFunc
//                                                               .colorFromHex(
//                                                                   '#B0C3B2'))),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           color: GlobalFunc
//                                                               .colorFromHex(
//                                                                   '#B0C3B2')))),
//                                           obscureText: false,
//                                           onChanged: (text) {
//                                             email = text.trim();
//                                           },
//                                         ),
//                                       )),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               text: 'Cancel',
//                               recognizer: new TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.of(context).pop();
//                                 },
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Continue',
//                               recognizer: new TapGestureRecognizer()
//                                 ..onTap = () async {
//                                   if (email == "" ||
//                                       email == null ||
//                                       !EmailValidator.validate(email)) {
//                                     GlobalFunc.showToast(
//                                         GlobalVars.ENTER_VALID_EMAIL);
//                                     return;
//                                   }
//                                   postPasswordRecovery(email, context);
//                                   // _CreatePlayList(playListName);
//                                 },
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Future postData() async {
//     Map<String, dynamic> parameterData = Map();
//     parameterData.putIfAbsent("username", () => username);
//     parameterData.putIfAbsent("password", () => _password);
//     //parameterData.putIfAbsent("firebaseInstanceID", () => "blank");
//     if (Platform.isAndroid) {
//       var androidInfo = await DeviceInfoPlugin().androidInfo;
//       var release = androidInfo.version.release;
//       var sdkInt = androidInfo.version.sdkInt;
//       var manufacturer = androidInfo.manufacturer;
//       var model = androidInfo.model;
//       print('Android $release (SDK $sdkInt), $manufacturer $model');
//       parameterData.putIfAbsent("deviceType", () => "android");
//       parameterData.putIfAbsent(
//           "deviceName", () => "Android $manufacturer $model");
//       parameterData.putIfAbsent("osVersion", () => "$sdkInt");
//     }

//     if (Platform.isIOS) {
//       var iosInfo = await DeviceInfoPlugin().iosInfo;
//       var systemName = iosInfo.systemName;
//       var version = iosInfo.systemVersion;
//       var name = iosInfo.name;
//       var model = iosInfo.model;
//       print('$systemName $version, $name $model');

//       parameterData.putIfAbsent("deviceType", () => "ios");
//       parameterData.putIfAbsent(
//           "deviceName", () => "$systemName $version, $name $model");
//       parameterData.putIfAbsent("osVersion", () => "$version");
//     }

//     updateLoadingState(true);

//     try {
//      // var url="http://rupeestreet.com/xhpbackend/auth/login"+?username=peter&password=123456
//      //http://rupeestreet.com/xhpbackend/api/auth/login?username=peter&password=123456
//       http.Response res = await HttpUtils.getClient().post(Uri.parse("http://rupeestreet.com/xhpbackend/api/auth/login?username="+"$username"+"&password="+"$_password"),
//           headers: HttpUtils.getHeaders(),
//           body: jsonEncode(parameterData)); // post api call
//       updateLoadingState(false);

//       var json = jsonDecode(res.body);
//       print(json);
//       if (json['status'] == 1) {
//         User user = User.fromJson(json['Data']);
//         Navigator.pushReplacementNamed(context, "/home");
//         //  GlobalFunc.moveuserAccordingLoginState(user, context, sharedPref);

//         /* final prefs = await SharedPreferences.getInstance();
//         prefs.setBool(GlobalVars.isLogin, true);
//         sharedPref.save(GlobalVars.user, json['Data']);
//         prefs.setString(GlobalVars.id, json['Data']['userID']);
//         Navigator.pushNamedAndRemoveUntil(context, "/category", (route) => false);*/
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => new AlertDialog(
//             title: TextWidget(text: "Incorrect Details", textSize: 16),
//             content: Text('Please Enter correct details *'),
//           ),
//         );
//       }
//     } on SocketException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('No Internet connection 😑');
//       return Future.error('No Internet connection 😑');
//     } on FormatException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Bad response format 👎');
//       return Future.error('Bad response format 👎');
//     } on Exception {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Unexpected error 😢');
//       return Future.error('Unexpected error 😢');
//     }
//   }



//   Future postPasswordRecovery(String email, BuildContext context) async {
//     Map<String, dynamic> parameterData = Map();
//     parameterData.putIfAbsent("email", () => email);

//     //updateLoadingState(true);

//     try {
//       http.Response res = await HttpUtils.getClient().post(
//           GlobalVars.PASSWORD_RECOVERY_URL,
//           headers: HttpUtils.getHeaders(),
//           body: jsonEncode(parameterData)); // post api call
//       //  updateLoadingState(false);

//       var json = jsonDecode(res.body);
//       print(json);
//       if (json['Status'] == 1) {
//         GlobalFunc.showToast(json['Message']);
//         Navigator.of(context).pop();
//       } else {
//         GlobalFunc.showToast(json['Message']);
//       }
//     } on SocketException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('No Internet connection 😑');
//       return Future.error('No Internet connection 😑');
//     } on FormatException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Bad response format 👎');
//       return Future.error('Bad response format 👎');
//     } on Exception {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Unexpected error 😢');
//       return Future.error('Unexpected error 😢');
//     }
//   }
// }






// import 'dart:convert';
// import 'dart:io';
// import 'package:device_info/device_info.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:xhp/models/User.dart';
// import 'package:xhp/networking/ApiProvider.dart';
// import 'package:xhp/utils/GlobalFuncs.dart';
// import 'package:xhp/utils/SharedPref.dart';
// import 'package:xhp/utils/global_vars.dart';
// import 'package:xhp/utils/httpUtils.dart';
// import 'package:xhp/widgets/GlobalWidgets.dart';
// import 'package:xhp/widgets/button_widget.dart';
// import 'package:xhp/widgets/text_widget.dart';

// class Login extends StatefulWidget {
//   @override
//   _Login createState() => _Login();
// }

// class _Login extends State<Login> {
//   SharedPref sharedPref = SharedPref();
//   String _email = "";
//   String _password = "";
//   bool _loading = false;
//   bool show_pass = true;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _loading
//           ? GlobalFunc.ProgressBar()
//           : SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                       padding: EdgeInsets.only(top: 80.0),
//                       alignment: Alignment.topCenter,
//                       /*decoration: BoxDecoration(
//                     //color: Main.opacityColor,
//                     image: DecorationImage(
//                       image: AssetImage("assets/app_icon.png"),
//                       colorFilter: ColorFilter.mode(
//                           Colors.deepPurple.withOpacity(0.7), BlendMode.srcATop),
//                       fit: BoxFit.cover,
//                     ),
//                   ),*/
//                       child: Stack(
//                         overflow: Overflow.clip,
//                         children: <Widget>[
//                           Column(
//                             children: <Widget>[
//                               GlobalWidgets.getCircleAppIcon(radious: 100),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 alignment: Alignment.topCenter,
//                                 child: Text(
//                                   "Login",
//                                   textAlign: TextAlign.center,
//                                   style: Theme.of(context).textTheme.headline2,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 50.0,
//                               ),
//                             ],
//                           ),
//                         ],
//                       )),
//                   Container(
//                     margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         TextField(
                        
//                          // textAlign: TextAlign.center,
//                           decoration: InputDecoration(
//                             labelText: 'Username',
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                     //color: Main.primaryColor,
//                                     width: 2.5,
//                                     style: BorderStyle.solid)),
//                             prefixIcon: Icon(Icons.person_outline,
//                                 color: Theme.of(context).accentColor),
                               
                           
//                             hintStyle: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           onChanged: (value) {
//                             try {
//                               _email = value.trim();
//                             } catch (e) {
//                               print(e);
//                               _email = value;
//                             }
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         TextField(
//                           obscureText: show_pass,
//                           obscuringCharacter: "*",
                         
//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             suffixIcon: IconButton(
//                               icon: Icon(show_pass
//                                   ? Icons.visibility
//                                   : Icons.visibility_off),
//                               onPressed: () {
//                                 setState(() {
//                                   show_pass = !show_pass;
//                                 });
//                               },
//                               color: Theme.of(context).focusColor,
                              
//                             ),
//                             focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(
//                                     //color: Main.primaryColor,
//                                     width: 2.5,
//                                     style: BorderStyle.solid)),
//                             prefixIcon: Icon(Icons.lock_outline,
//                                 color: Theme.of(context).accentColor),
//                             hintText: '••••••••••••',
//                             hintStyle: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           onChanged: (value) {
//                             _password = value;
//                           },
//                         ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         ButtonWidget(
//                           text: "Login",
//                           width: 170,
//                           onPressed: () {
//                             if (_email == "" || _email == null) {
//                               GlobalFunc.showToast(
//                                   GlobalVars.ENTER_VALID_EMAIL);
//                             } else if (_password == "" || _password == null) {
//                               GlobalFunc.showToast(GlobalVars.ENTER_PASSWORD);
//                             } else {
//                               postData();
//                             }
//                           },
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         FlatButton(
//                           onPressed: () {
//                             showPasswordRecovery();
//                           },
//                           child: Text(
//                             "Forgot password?",
//                             style: TextStyle(
//                                 fontStyle: FontStyle.normal,
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: 14.0,
//                                 color: Color(0xFF222222)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//     );
//   }

//   showPasswordRecovery() {
//     String email = "";

//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: Container(
//               height: 180,
// //              color: GlobalFunc.colorFromHex('#522B83'),
//               decoration: new BoxDecoration(
//                   color: GlobalFunc.colorFromHex('#522B83'),
//                   borderRadius: BorderRadius.circular(20.0)),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Stack(
//                               children: <Widget>[
//                                 Positioned(
//                                   child: Align(
//                                       alignment: Alignment.center,
//                                       child: Container(
//                                         margin: EdgeInsets.only(left: 35),
//                                         padding: EdgeInsets.only(top: 53.5),
//                                         child: TextFormField(
//                                           autofocus: true,
//                                           maxLines: 1,
//                                           maxLength: 20,
//                                           validator: (val) => val.isEmpty
//                                               ? GlobalVars.ENTER_VALID_EMAIL
//                                               : null,
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Montserrat_SemiBold',
//                                           ),
//                                           cursorColor: Colors.white,
//                                           decoration: InputDecoration(
//                                               counterText: "",
//                                               hintStyle: TextStyle(
//                                                   color: Colors.white
//                                                       .withOpacity(.5)),
//                                               hintText: 'Username*',
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           color: GlobalFunc
//                                                               .colorFromHex(
//                                                                   '#B0C3B2'))),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                       borderSide: BorderSide(
//                                                           color: GlobalFunc
//                                                               .colorFromHex(
//                                                                   '#B0C3B2')))),
//                                           obscureText: false,
//                                           onChanged: (text) {
//                                             email = text.trim();
//                                           },
//                                         ),
//                                       )),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           RichText(
//                             text: TextSpan(
//                               text: 'Cancel',
//                               recognizer: new TapGestureRecognizer()
//                                 ..onTap = () {
//                                   Navigator.of(context).pop();
//                                 },
//                             ),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Continue',
//                               recognizer: new TapGestureRecognizer()
//                                 ..onTap = () async {
//                                   if (email == "" ||
//                                       email == null ||
//                                       !EmailValidator.validate(email)) {
//                                     GlobalFunc.showToast(
//                                         GlobalVars.ENTER_VALID_EMAIL);
//                                     return;
//                                   }
//                                   postPasswordRecovery(email, context);
//                                   // _CreatePlayList(playListName);
//                                 },
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }

//   Future postData() async {
//     Map<String, dynamic> parameterData = Map();
//     parameterData.putIfAbsent("username", () => _email);
//     parameterData.putIfAbsent("password", () => _password);
//     //parameterData.putIfAbsent("firebaseInstanceID", () => "blank");
//     if (Platform.isAndroid) {
//       var androidInfo = await DeviceInfoPlugin().androidInfo;
//       var release = androidInfo.version.release;
//       var sdkInt = androidInfo.version.sdkInt;
//       var manufacturer = androidInfo.manufacturer;
//       var model = androidInfo.model;
//       print('Android $release (SDK $sdkInt), $manufacturer $model');
//       parameterData.putIfAbsent("deviceType", () => "android");
//       parameterData.putIfAbsent(
//           "deviceName", () => "Android $manufacturer $model");
//       parameterData.putIfAbsent("osVersion", () => "$sdkInt");
//     }

//     if (Platform.isIOS) {
//       var iosInfo = await DeviceInfoPlugin().iosInfo;
//       var systemName = iosInfo.systemName;
//       var version = iosInfo.systemVersion;
//       var name = iosInfo.name;
//       var model = iosInfo.model;
//       print('$systemName $version, $name $model');

//       parameterData.putIfAbsent("deviceType", () => "ios");
//       parameterData.putIfAbsent(
//           "deviceName", () => "$systemName $version, $name $model");
//       parameterData.putIfAbsent("osVersion", () => "$version");
//     }

//     updateLoadingState(true);

//     try {
//      // var url="http://rupeestreet.com/xhpbackend/auth/login"+?username=peter&password=123456
//      //http://rupeestreet.com/xhpbackend/api/auth/login?username=peter&password=123456
//       http.Response res = await HttpUtils.getClient().post(Uri.parse("http://rupeestreet.com/xhpbackend/api/auth/login?username="+"$_email"+"&password="+"$_password"),
//           headers: HttpUtils.getHeaders(),
//           body: jsonEncode(parameterData)); // post api call
//       updateLoadingState(false);

//       var json = jsonDecode(res.body);
//       print(json);
//       if (json['status'] == 1) {
//         User user = User.fromJson(json['Data']);
//         Navigator.pushReplacementNamed(context, "/home");
//         //  GlobalFunc.moveuserAccordingLoginState(user, context, sharedPref);

//         /* final prefs = await SharedPreferences.getInstance();
//         prefs.setBool(GlobalVars.isLogin, true);
//         sharedPref.save(GlobalVars.user, json['Data']);
//         prefs.setString(GlobalVars.id, json['Data']['userID']);
//         Navigator.pushNamedAndRemoveUntil(context, "/category", (route) => false);*/
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => new AlertDialog(
//             title: TextWidget(text: "Incorrect Details", textSize: 16),
//             content: Text('Please Enter correct details *'),
//           ),
//         );
//       }
//     } on SocketException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('No Internet connection 😑');
//       return Future.error('No Internet connection 😑');
//     } on FormatException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Bad response format 👎');
//       return Future.error('Bad response format 👎');
//     } on Exception {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Unexpected error 😢');
//       return Future.error('Unexpected error 😢');
//     }
//   }

//   updateLoadingState(bool loading) {
//     setState(() {
//       this._loading = loading;
//     });
//   }

//   Future postPasswordRecovery(String email, BuildContext context) async {
//     Map<String, dynamic> parameterData = Map();
//     parameterData.putIfAbsent("email", () => email);

//     //updateLoadingState(true);

//     try {
//       http.Response res = await HttpUtils.getClient().post(
//           GlobalVars.PASSWORD_RECOVERY_URL,
//           headers: HttpUtils.getHeaders(),
//           body: jsonEncode(parameterData)); // post api call
//       //  updateLoadingState(false);

//       var json = jsonDecode(res.body);
//       print(json);
//       if (json['Status'] == 1) {
//         GlobalFunc.showToast(json['Message']);
//         Navigator.of(context).pop();
//       } else {
//         GlobalFunc.showToast(json['Message']);
//       }
//     } on SocketException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('No Internet connection 😑');
//       return Future.error('No Internet connection 😑');
//     } on FormatException {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Bad response format 👎');
//       return Future.error('Bad response format 👎');
//     } on Exception {
//       updateLoadingState(false);
//       GlobalFunc.showToast('Unexpected error 😢');
//       return Future.error('Unexpected error 😢');
//     }
//   }
// }





