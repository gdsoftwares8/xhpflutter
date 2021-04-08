import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xhp/blocs/ChuckBookAppointment.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class NBookAppointment extends StatefulWidget {
  @override
  _NBookAppointmentState createState() => _NBookAppointmentState();
}

class _NBookAppointmentState extends State<NBookAppointment> {
  TextEditingController dateCtl;
  TextEditingController timeCtl;
  String formattedStr;
  bool checkBoxValue=false;
  bool checkBoxValue2=false;
  String _selectedText;
  String memberName;
  String location;
  ChuckBookAppointmentbloc _bloc;
  String memberId="1";
  String fkId='1';
  String isRebate='1';
  String company='Company';
  String company_membership_no="01000013";
  String service_category='Exercise Physiology';
  

  @override
  void initState() {
    // TODO: implement initState
    dateCtl = TextEditingController();
    timeCtl = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dateCtl.dispose();
    timeCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
                  child: Column(children: [
            TopWidget(text: "Book Appointment"),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextWidget(
                            text: "Who is the appointment for",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          BoxTextFormWidget(
                            hintText: "Member Name",
                            onChanged: (value) {
                                memberName = value;
                              },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(
                            text: "Type of Service",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          BoxTextFormWidget(
                            hintText: "Type of Service",
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextWidget(
                            text: "Location of Service",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          BoxTextFormWidget(
                            hintText: "Location",
                             onChanged: (value) {
                                location = value;
                              },
                          )
                        ],
                      ),
                                   Column(
                                     children: [TextWidget(
                            text: "Select Service Provider",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height:3),
                        
                                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                             width: MediaQuery.of(context).size.width*.40,
                        height: MediaQuery.of(context).size.width*.12,
                          
                          decoration: BoxDecoration(color:Colors.grey[300],borderRadius: BorderRadius.circular(25),border:Border.all(color:Colors.black) ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              
                            hint: TextWidget(text: "Select Service Provider",fontWeight: FontWeight.bold,),
                              value: _selectedText,
                              items: <String>['One', 'Two', 'Three']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value,color: Colors.black,fontWeight: FontWeight.bold,),
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
                      // Column(
                      //   children: [
                      //     TextWidget(
                      //       text: "Select Service Provider",
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     SizedBox(height: 10),
                      //     BoxTextFormWidget(onChanged: (){

                      //     },
                      //       hintText: "Service Provider",
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextWidget(text: "Date",fontWeight: FontWeight.bold,),
                          SizedBox(height: 10),
                          BoxTextFormWidget(  
                            style: TextStyle(fontSize: 15),
                            width: 60,                         
                            hintText: "Date",
                            suffixIcon: Icon(Icons.calendar_today),
                            controller: dateCtl,
                            onTap: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              formattedStr = formatDate(
                                date,
                                [
                                  dd,
                                  '/',
                                  mm,
                                  '/',
                                  yyyy,
                                ],
                              );
                              //var x = date.toIso8601String().substring(0, 10);
                              dateCtl.text = formattedStr;
                            },
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(text: "Preferred Time",fontWeight: FontWeight.bold,),
                          SizedBox(height: 10),
                          BoxTextFormWidget(
                            hintText: 'Time*',
                            suffixIcon: Icon(Icons.watch),
                            controller: timeCtl, // add this line.

                            onTap: () async {
                              TimeOfDay time = TimeOfDay.now();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              TimeOfDay picked = await showTimePicker(
                                  context: context, initialTime: time);
                              if (picked != null && picked != time) {
                                timeCtl.text = picked
                                    .toString()
                                    .substring(10, 15); // add this line.
                                // setState(() {
                                //   time = picked;
                                // });
                              }
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'cant be empty';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height:20),
                   TextWidget(
                            text: "Do you want to use extras health insurance",
                            fontWeight: FontWeight.bold,
                          ),
                
                  Row(
                    //  bool checkBoxValue=false;
  //bool checkBoxValue2=false;
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: checkBoxValue,
            activeColor: GlobalVars.primaryColor,
            onChanged:(bool newValue){
          setState(() {
            checkBoxValue = newValue;
            checkBoxValue2=false;
            
          });
            }),TextWidget(text:'No',fontWeight: FontWeight.bold,)       
                        ],
                      ),
             Row(
               children: [
                 Checkbox(value: checkBoxValue2,
            activeColor: GlobalVars.primaryColor,
            onChanged:(bool newValue){
          setState(() {
            checkBoxValue2 = newValue;
            checkBoxValue=false;
          });
            }),TextWidget(text:'Yes',fontWeight: FontWeight.bold,)
       
               ],
             ),
            
                    ]
                  ),
                  SizedBox(height:20),
                ButtonWidget(
                    text: 'Book Appointment',
                    onPressed: () {
                      _bloc=ChuckBookAppointmentbloc(memberId, fkId, timeCtl.text, dateCtl.text, isRebate, company, service_category, company_membership_no);
                                  Fluttertoast.showToast(
            msg: "Booking Done Successfully! Please Wait...",
          );
                                Navigator.of(context)
                                  .pushReplacementNamed('/home');
          //             return showDialog(
          //               context: context,
          //               builder: (context) => new AlertDialog(
          //                 content: TextWidget(text:'Do you want to book ?',textSize: 18,),
          //                 actionsPadding:
          //                 EdgeInsets.only(left: 30, right: 30),
          //                 actions: <Widget>[
          //                   GestureDetector(
          //                     onTap: () => Navigator.of(context).pop(false),
          //                     child: TextWidget(text:
          //                     "Cancel",
          //                       textSize: 14,
          //                       // style: TextStyle(
          //                       //     color: Theme.of(context).accentColor,
          //                       //     fontSize: 14.0,
          //                       //     fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                   SizedBox(width: 20),
          //                   //SizedBox(width: MediaQuery.of(context).size.width*.35),
          //                   GestureDetector(
          //                     onTap: () {
          //                         //_bloc.fetchBookAppointmets(memberId, fkId, timeCtl.text, dateCtl.text, isRebate, company, service_category, company_membership_no);
          //                         _bloc=ChuckBookAppointmentbloc(memberId, fkId, timeCtl.text, dateCtl.text, isRebate, company, service_category, company_membership_no);
          //                         Fluttertoast.showToast(
          //   msg: "Booking Done Successfully!",
          // );
          //                       Navigator.of(context)
          //                         .pushReplacementNamed('/home');},
          //                     child: TextWidget(text:
          //                     "Yes",
          //                       textSize: 14,
          //                       // style: TextStyle(
          //                       //     color: Theme.of(context).accentColor,
          //                       //     fontSize: 14.0,
          //                       //     fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ) ??
          //                 false;
                    }),
                    SizedBox(height:40),
                    DashLogout(),
              //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     ButtonWidget(width:size.width*.40,text: "Dashboard", onPressed: (){
              //       Navigator.pushReplacementNamed(context, "/home");

              //     }),
              //     ButtonWidget(width:size.width*.40,text: "Logout", onPressed: (){

              //     }),
              //   ],
              // )


                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
