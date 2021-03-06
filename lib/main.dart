import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xhp/SplashScreen.dart';
import 'package:xhp/pages/dashboard.dart';
import 'package:xhp/pages/login.dart';
import 'package:xhp/pages/reports/contributions.dart';
import 'package:xhp/pages/reports/expenses-statement.dart';
import 'package:xhp/pages/reports/financial-report.dart';
import 'package:xhp/pages/settings/profile.dart';
import 'package:xhp/pages/signup.dart';
import 'package:xhp/pages/signupdemo.dart';
import 'package:xhp/utils/global_vars.dart';
import 'pages/PointId.dart';
import 'pages/account/secondary_mem.dart';
import 'pages/appointment/appointment-status.dart';
import 'pages/appointment/appointments.dart';
import 'pages/appointment/book-appointment.dart';
import 'pages/appointment/confirm-ifc.dart';
import 'pages/appointment/confirm-instruc.dart';
import 'pages/appointment/history-appointments.dart';
import 'pages/appointment/pay-submit.dart';
import 'pages/appointment/update_appointment.dart';
import 'pages/forgotpass.dart';
import 'pages/gifts/gift.dart';
import 'pages/home.dart';
import 'pages/invoices/gap-history.dart';
import 'pages/invoices/non-partner.dart';
import 'pages/invoices/non-pref-part.dart';
import 'pages/invoices/pending-invoice.dart';
import 'pages/reports/appointment-reports.dart';
import 'pages/reports/gift-statement.dart';
import 'pages/reports/interest-report.dart';
import 'pages/reports/newreport.dart';
import 'pages/reports/report.dart';
import 'pages/reports/rollover-amount.dart';
import 'pages/reports/tax-statement.dart';
import 'pages/settings/manage-profile.dart';
import 'pages/settings/withdrawal.dart';
import 'pages/signup/newsignup.dart';
import 'pages/signup/newsignup2.dart';
import 'pages/signup/payment-form.dart';
import 'provider/sign_up_provider.dart';
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
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider())
      ],child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XHP',
      theme: ThemeData(
        primarySwatch: GlobalVars.primaryColor,
        accentColor: GlobalVars.accentColor,
        scaffoldBackgroundColor:  Colors.grey[100],
        appBarTheme: AppBarTheme(
          color: Colors.blue[900],
          elevation: 5
        ),
        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                primary: GlobalVars.buttonColor,
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
        "/splash": (context) => SplashScreen(),
        "/signup": (context) => SignUpp(),
        "/welcome": (context) => Welcome(),
        "/login": (context) => Login(),
        "/home":(context)=> DashBoard(),
        "/book-appointment":(context)=>NBookAppointment(),
        "/book-history":(context)=>AppointmentHistory(),
        "/issue-gift":(context)=>IssueGift(),
        "/receive-gift":(context)=>GiftReceive(),
        "/pending-invoice":(context)=>PendingInvoice(),
        "/non-partner":(context) =>NonPartner(),
        "/gap-history":(context)=>GapHistory(),
        "/appointment-report":(context)=>AppointmentReport(),
        "/contributions":(context)=>Contribution(),
        "/financial":(context)=>Financial(),
        "/contributions-history":(context) =>ContributionHistory(),
        "/interest-history":(context)=>InterestHistory(),
        "/profile":(context)=>Profile(),
        "/forgot-password":(context)=>ForgotPassword(),
        "/withdrawal":(context)=>PendingWithdrawal(),
        "/appointment-status":(context)=>AppointmentStatus(),
        "/confirm-ifc":(context)=>ConfirmIFC(),
        "/confirm-instr":(context)=>ConfirmInstruc(),
        "/pay-submit":(context)=>PaySubmit(),
        "/report":(context)=>ReportMain(),
        "/my-profile":(context)=>ManageProfile(),
        "/update-appointment":(context)=>UpdateAppointment(),
        "/non-preferred-partner":(context)=>NonPrefPartner(),
        "/secondary-member":(context)=>SecondaryMember(),
        "/roll-over":(context)=>RolloverStatement(),
        "/tax-statement":(context)=>TaxStatement(),
        "/gift-statement":(context)=>GiftStatement(),
        "/expenses-statement":(context)=>ExpensesStatement(),
        


        //"gift-history":(context)=>
      },
      home: SplashScreen(),
    ));
  }
}
