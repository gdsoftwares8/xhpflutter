import 'package:flutter/material.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution> {
  String _selectedText;
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Card(
            margin: EdgeInsets.all(5),
            elevation: 2,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF3a1172),
                        border: Border.all(
                          color: Color(0xFF3a1172),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: TextWidget(
                        text: "Contribution Reports",
                        color: Colors.white,
                        textSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
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
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
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
                  SizedBox(height:20),
                  ButtonWidget(
                      text: 'Appointment History',
                      onPressed: () {
                        return showDialog(
                              context: context,
                              builder: (context) => new AlertDialog(
                                content: TextWidget(text:'Do you want to check ?',textSize: 18,),
                                actionsPadding:
                                    EdgeInsets.only(left: 30, right: 30),
                                actions: <Widget>[
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pop(false),
                                    child: TextWidget(text:
                                      "Cancel",
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
                                    child: TextWidget(text:
                                      "Yes",
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
                ]),
          ),
        ),
      ),
    );
  }
}
