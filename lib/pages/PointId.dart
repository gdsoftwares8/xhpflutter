import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class PointId extends StatefulWidget {
  @override
  _PointIdState createState() => _PointIdState();
}

class _PointIdState extends State<PointId> {
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  bool checkBoxValue7 = false;
  bool checkBoxValue8 = false;
  bool checkBoxValue9 = false;
  bool checkBoxValue10 = false;
  bool checkBoxValue11 = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TopWidget(text: "100 Point ID"),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "First Name"),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Middle Name"),
                  BoxTextFormWidgett(
                      width: size.width * .30, hintText: "Last Name"),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextFormWidgett(width: size.width * .30, hintText: "DOB"),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .40,
                    text: "Confirm Details",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .40,
                    text: "Update Details",
                    textSize: 11,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              TextWidget(
                text: "Australian  Citizenship  | Residence Status",
                textAlign: TextAlign.center,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    TextWidget(
                      text: "Are you an Australian  Citizenship",
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: checkBoxValue,
                            activeColor: GlobalVars.primaryColor,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValue = newValue;
                                checkBoxValue2 = false;
                              });
                            }),
                        TextWidget(
                          text: 'Yes',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: checkBoxValue2,
                            activeColor: GlobalVars.primaryColor,
                            onChanged: (bool newValue) {
                              setState(() {
                                checkBoxValue2 = newValue;
                                checkBoxValue = false;
                              });
                            }),
                        TextWidget(
                          text: 'No',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ]),
               
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextWidget(
                  text: "Are you resident in Australia",
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue3,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue3 = newValue;
                            checkBoxValue4 = false;
                          });
                        }),
                    TextWidget(
                      text: 'Yes',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue4,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue4 = newValue;
                            checkBoxValue3 = false;
                          });
                        }),
                    TextWidget(
                      text: 'No',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextWidget(
                  text:
                      "Have you been a Tax resident of \nanother country in last 3 years",
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue5,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue5 = newValue;
                            checkBoxValue6 = false;
                          });
                        }),
                    TextWidget(
                      text: 'No',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue6,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue6 = newValue;
                            checkBoxValue5 = false;
                          });
                        }),
                    TextWidget(
                      text: 'Yes',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextWidget(
                  text: "Are you of Aboriginal Descent",
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue7,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue7 = newValue;
                            checkBoxValue8 = false;
                          });
                        }),
                    TextWidget(
                      text: 'No',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue8,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue8 = newValue;
                            checkBoxValue7 = false;
                          });
                        }),
                    TextWidget(
                      text: 'Yes',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                TextWidget(
                  text: "Are you  politically  exposed",
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue9,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue9 = newValue;
                            checkBoxValue10 = false;
                          });
                        }),
                    TextWidget(
                      text: 'No',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue10,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue10 = newValue;
                            checkBoxValue9 = false;
                          });
                        }),
                    TextWidget(
                      text: 'Yes',
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ]),]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              NewTextWidget(
                text: "100 Point ID",
              ),
              SizedBox(height: 10),
              TextWidget(
                text:
                    "Please select a form of ID from below. \nPlease note there is a fee for ID verfication, \nplease ensure that correct data is provided. \nData should match as in the chosen document",
                textAlign: TextAlign.center,
              ),
              TextWidget(
                text:
                    "Please ensure that correct data is provided. \nData should match as in the chosen document",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .30,
                    text: "Drivers \nLicence",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Medicare",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Centrelink",
                    textSize: 11,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .30,
                    text: "Passport",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Citizenship",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Birth\nCertificate",
                    textSize: 11,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .30,
                    text: "Name\nChange",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Marriage\nCertificate",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .32,
                    text: "Visa",
                    textSize: 11,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .30,
                    text: "Descent\nCertificate",
                    textSize: 11,
                  ),
                  ButtonWidget(
                    onPressed: () {},
                    width: size.width * .33,
                    text: "Immigration\nCertificate",
                    textSize: 11,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextWidget(text: "Load details as required by Rapid ID Api"),
              SizedBox(height: 20),
              Container(
                color: Colors.grey[300],
                height: size.height * .50,
              ),
               Row(
                  children: [
                    Checkbox(
                        value: checkBoxValue11,
                        activeColor: GlobalVars.primaryColor,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkBoxValue11 = newValue;
                            
                          });
                        }),
                    Container(
                      width: size.width*.80,
                   
                      
                      child: TextWidget( maxLines: 2,
                              text: 'By clicking Submit, I confirm that consent has been obtained from the document holder to check the identifying information with the Issuer/Official record holder for the purpose of confirming their identity.I can confirm that the details provided are correct. ',
                            
                         
                            ),
                    ),
                     
                  ],
                ),
              SizedBox(height: 40),
              ButtonWidget(
                  width: size.width * .40, text: "Submit", onPressed: () {}),
            ]),
          ),
        ),
      ),
    );
  }
}
