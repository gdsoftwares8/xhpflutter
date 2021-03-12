import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xhp/SplashScreen.dart';
import 'package:xhp/login_screen.dart';
import 'package:xhp/utils/global_vars.dart';
import 'welcome.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: GlobalVars.primaryColor,
        accentColor: GlobalVars.accentColor,
        scaffoldBackgroundColor:  Colors.grey[100],
        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                primary: GlobalVars.accentColor,
                elevation: 5.0,
                textStyle: TextStyle(fontSize: 15.0, color: Colors.white, fontFamily: 'OpenSans-Light')
            )),

          // outlined button theme
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(15),
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              )),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        fontFamily: "Montserrat-Light",
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'OpenSans-Light'),
        ),
      ),
      themeMode: ThemeMode.light,
      routes: {
        "/login": (context) => Login(),
        "/welcome": (context) => Welcome(),
        "/login": (context) => Login()
      },
      home: SplashScreen(),
    );
  }
}
