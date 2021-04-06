import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class RolloverStatement extends StatefulWidget {
  @override
  _RolloverStatementState createState() => _RolloverStatementState();
}

class _RolloverStatementState extends State<RolloverStatement> {
  String _selectedText;
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children:[
            TopWidget(text:"Rollover Amount"),
            SizedBox(height:40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(text: "Financial Year",textSize: 18,fontWeight: FontWeight.bold,),
                                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                                                   width: MediaQuery.of(context).size.width*.40,
                        height: MediaQuery.of(context).size.height*.04,
                          decoration: BoxDecoration(color:GlobalVars.primaryColor,borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                                dropdownColor: GlobalVars.primaryColor,
                            hint: TextWidget(text: "Financial Year ",color: Colors.white,),
                              value: _selectedText,
                              items: <String>['2018-2019', '2019-2020', '2020-2021']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value,color: Colors.white,),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height:40),
            // ButtonWidget(width:size.width*.60,text: "Appointment Status", onPressed: (){

            // }),
          SizedBox(height:40),
            NewTextWidget(width:size.width*.60,text: "Amount Rolled Over", ),SizedBox(height:40),
            NewTextWidget(width:size.width*.60,text: "\$500.00"),SizedBox(height:40),
            SizedBox(height:60),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(width:size.width*.40,text: "Dashboard", onPressed: (){

                }),
                ButtonWidget(width:size.width*.40,text: "Logout", onPressed: (){

                }),
              ],
            )
          ]),
        ),
        
        
      ),
    );
  }
}