import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';
class AppointmentReport extends StatefulWidget {
  @override
  _AppointmentReportState createState() => _AppointmentReportState();
}

class _AppointmentReportState extends State<AppointmentReport> {
  String _selectedText;
  String _selectedText2;
  String _selectedText3;
  String _selectedText4;
  String _selectedText5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Appointment Reports",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(5),
                elevation: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Financial Year",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "Select Year "),
                              value: _selectedText,
                              items: <String>['2018-2019', '2019-2020', '2020-2021']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Member",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "Select Member"),
                              value: _selectedText2,
                              items: <String>['Peter Goerg', 'Patricia Goerg']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText2 = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Appointment Status*",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "Select Category"),
                              value: _selectedText3,
                              items: <String>[
                                'Pending Appointment',
                                'Waiting For Confirmation',
                                'Completed Appointment'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText3 = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Service Category*",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "Select  Service Category"),
                              value: _selectedText4,
                              items: <String>[
                                'Dental',
                                'Acupunture',
                                'Dietetician',
                                'Exercise Physiology',
                                'General Practitioner',
                                'Chinese Herbal Medicine',
                                'Myotherapy',
                                'Naturopathy',
                                'Occupational Therapy',
                                'Optical',
                                'Physiotherapy'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText4 = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Appointment Status*",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "IFC Status"),
                              value: _selectedText5,
                              items: <String>[
                                'Pending IFC',
                                'Waiting IFC',
                                'Completed IFC'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText5 = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      
                    ]),
              ),
              SizedBox(height:20),
              ButtonWidget(
                          text: 'Appointment History',
                          onPressed: () {
                            return showDialog(
                                  context: context,
                                  builder: (context) => new AlertDialog(
                                    content: TextWidget(
                                      text: 'Do you want to check ?',
                                      textSize: 18,
                                    ),
                                    actionsPadding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    actions: <Widget>[
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(false),
                                        child: TextWidget(
                                          text: "Cancel",
                                          textSize: 14,
                                          // style: TextStyle(
                                          //     color: Theme.of(context).accentColor,
                                          //     fontSize: 14.0,
                                          //     fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      //SizedBox(width: MediaQuery.of(context).size.width*.35),
                                      GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pushReplacementNamed('/home'),
                                        child: TextWidget(
                                          text: "Yes",
                                          textSize: 14,
                                          // style: TextStyle(
                                          //     color: Theme.of(context).accentColor,
                                          //     fontSize: 14.0,
                                          //     fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;
                          })
            ],
          ),
        ),
      ),
    );
  }
}
