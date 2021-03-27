import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/widgets/OtionTab.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
               
              ),
              Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Profile\nManagement",
                          icon: FontAwesomeIcons.user,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/contributions');
                          }),
                      OptionTab(
                          tabText: "Add\nMembers",
                          icon: FontAwesomeIcons.plusSquare,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/financial');
                          }),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Contribution",
                          icon: FontAwesomeIcons.fileInvoice,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/appointment-report');
                          }),
                      OptionTab(
                          tabText: "Withdrawal",
                          icon: FontAwesomeIcons.fileExport,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/non-partner');
                          }),
                    ],
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Suspension",
                          icon: FontAwesomeIcons.fileExcel,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/non-partner');
                          }),
                      OptionTab(
                          tabText: "Cancellation",
                          icon: Icons.cancel,
                          onPressed: (){
                            //  Navigator.pushNamed(context, '/non-partner');
                          }),
                    ],
                  ),
              //
            ])
      )
      
    );
  }
}