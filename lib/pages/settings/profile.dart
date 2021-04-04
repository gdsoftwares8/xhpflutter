import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckLocalData.dart';
import 'package:xhp/models/user.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/TextWidgetEditable.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

enum Ans { Yes, No }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _savedbusiness;
  String _savedmember;
  String _servicecatgeory;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String location;
  Ans _ans;
  Ans _ans1;
  User user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    try {
      setState(() async {
        user = await ChuckLocalData.getUser();
        if (user != null) {
          _nameController.text = user.firstName + ' ' + user.lastName ?? "";
          _emailController.text = user.email;
          _dobController.text = "";
          _phoneController.text = user.mobileNo;
        }

        // _lastNameController.text = user.lastName ?? "";
        // _emailController.text = user.email ?? "";
        // _mobileNumberController.text = user.username ?? "";
        // _passwordController.text = user.password ?? "";
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: GlobalWidgets.getToolbarWithBack(
          title: "Profile",
          onPressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color(0xFF3a1172),
                    )),
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: TextWidget(
                        text: "Personal Details",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            TextWidgetEditable(
                              text: 'Name',
                              controller: _nameController,
                            ),
                            DividerWidget(),
                            TextWidgetEditable(
                              text: 'Email',
                              controller: _emailController,
                            ),
                            DividerWidget(),
                            TextWidgetEditable(
                              text: 'Date of Birth',
                              controller: _dobController,
                            ),
                            DividerWidget(),
                            TextWidgetEditable(
                              text: 'Phone Number',
                              controller: _phoneController,
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color(0xFF3a1172),
                    )),
                    child: ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: TextWidget(
                        text: "Account Info",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            TextWidgetEditable(
                              text: 'Account Type',
                              controller: _phoneController,
                            ),
                            TextWidget(text: "Account Type"),
                            TextWidget(text: "Savings"),
                            DividerWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text: "Bank Detail"),
                                TextWidget(text: "Member")
                              ],
                            ),
                            DividerWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text: "Account No."),
                                TextWidget(text: "12220051975")
                              ],
                            ),
                            DividerWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(text: "Account Owner"),
                                TextWidget(text: "Peter Georg")
                              ],
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color(0xFF3a1172),
                    )),
                    child: ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: TextWidget(
                        text: "Invoice Detail",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        Divider(height: 5),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Invoice Number*",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextWidget(text: "Date*"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Date",
                            hintText: "Date",
                            controller: dateCtl,
                            suffixIcon: Icon(Icons.calendar_today),
                            onTap: () async {
                              DateTime date = DateTime(1900);
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              var x = date.toIso8601String().substring(0, 10);
                              dateCtl.text = x;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Amuount*",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color(0xFF3a1172),
                    )),
                    child: ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                      title: TextWidget(
                        text: "Bank Details",
                        textSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextWidget(text: "Bank Detail Of*"),
                        ),
                        RadioListTile(
                          value: Ans.Yes,
                          groupValue: _ans,
                          onChanged: (value) {
                            setState(() {
                              _ans = value;
                            });
                          },
                          title: TextWidget(text: "Member"),
                          //selectedTileColor: Constant.primary,
                        ),
                        RadioListTile(
                          value: Ans.No,
                          groupValue: _ans,
                          onChanged: (value) {
                            setState(() {
                              _ans = value;
                            });
                          },
                          title: TextWidget(text: "Partner"),
                          // selectedTileColor: Constant.primary,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextWidget(text: "Account Type*"),
                        ),
                        RadioListTile(
                          value: Ans.Yes,
                          groupValue: _ans1,
                          onChanged: (value) {
                            setState(() {
                              _ans1 = value;
                            });
                          },
                          title: TextWidget(text: "Single"),
                          //selectedTileColor: Constant.primary,
                        ),
                        RadioListTile(
                          value: Ans.No,
                          groupValue: _ans1,
                          onChanged: (value) {
                            setState(() {
                              _ans1 = value;
                            });
                          },
                          title: TextWidget(text: "Joint"),
                          // selectedTileColor: Constant.primary,
                        ),
                        Divider(height: 5),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Account Owner*",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "BSB*",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Account Name / Account Type *",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormWidget(
                            labelText: "Account No *",
                            onChanged: (value) {
                              location = value;
                            },
                          ),
                        ),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                  // color: GlobalVars.accentColor,
                                  ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: TextWidget(
                              text: "Your Account Balance",
                              color: Colors.white,
                              textSize: 16,
                              fontWeight: FontWeight.bold,
                            ))),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.green[200],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextWidget(
                                  text: "\$3566.01",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[700],
                                ),
                                SizedBox(height: 5),
                                TextWidget(
                                  text: "Available Now",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.green[200],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextWidget(
                                  text: "\$0.00",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[700],
                                ),
                                SizedBox(height: 5),
                                TextWidget(
                                  text: "Available Hold",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.green[200],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextWidget(
                                  text: "\$3566.01",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[700],
                                ),
                                SizedBox(height: 5),
                                TextWidget(
                                  text: "Total Available ",
                                  textSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ButtonWidget(
                text: 'Generate',
                onPressed: () {
                  return showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          content: TextWidget(
                            text: 'Do you want to book ?',
                            textSize: 18,
                          ),
                          actionsPadding: EdgeInsets.only(left: 30, right: 30),
                          actions: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(false),
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
    ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:xhp/widgets/GlobalWidgets.dart';
// import 'package:xhp/widgets/TextForm.dart';
// import 'package:xhp/widgets/button_widget.dart';
// import 'package:xhp/widgets/text_widget.dart';
// import 'package:xhp/utils/global_vars.dart';

// enum Ans { Yes, No }

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String _savedbusiness;
//   String _savedmember;
//   String _servicecatgeory;
//   TextEditingController dateCtl = TextEditingController();
//   TextEditingController timeCtl = TextEditingController();
//   String location;
//   Ans _ans;
//   Ans _ans1;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: GlobalWidgets.getToolbarWithBack(
//               title: "Profile",
//               onPressed: (){
//                 Navigator.pop(context);
//               }),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Card(
//               child: Column(
//                 children: [
//                   Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
//                     child: ExpansionTile(
//                       initiallyExpanded: true,
//                       expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
//                       title: TextWidget(

//                         text: "Business Detail",
//                         textSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: [
//                         Divider(height: 5),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: TextWidget(
//                             text: "Select Saved Business*",
//                             //style: Constant.heading,
//                           ),
//                         ),
//                         SizedBox(height: 0),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButton<String>(
//                                 isExpanded: true,
//                                 hint: TextWidget(text: "Other"),
//                                 value: _savedbusiness,
//                                 items: <String>['XYZ', 'ABC'].map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: TextWidget(text: value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String val) {
//                                   setState(() {
//                                     _savedbusiness = val;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),

//                         SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(

//                             readOnly: true,
//                             enabled: false,

//                              labelText: "Business Name*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "ABN No*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "Address*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "City*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "State*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "PostCode*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height:5),
//                   Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
//                     child: ExpansionTile(
//                       expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
//                       title: TextWidget(
//                         text: "Non Partner Detail",
//                         textSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: [
//                         Divider(height: 5),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: TextWidget(
//                             text: "Member*",
//                             //style: Constant.heading,
//                           ),
//                         ),
//                         SizedBox(height: 0),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButton<String>(
//                                 hint: TextWidget(text: "Select Member"),
//                                 value: _savedmember,
//                                 items: <String>['XYZ', 'ABC'].map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: TextWidget(text: value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String val) {
//                                   setState(() {
//                                     _savedmember = val;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                                           Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: TextWidget(
//                             text: "Service Category*",
//                             //style: Constant.heading,
//                           ),
//                         ),
//                         SizedBox(height: 0),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: DropdownButton<String>(
//                                 hint: TextWidget(text: "Select Category"),
//                                 value: _servicecatgeory,
//                                 items: <String>['XYZ', 'ABC'].map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: TextWidget(text: value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String val) {
//                                   setState(() {
//                                     _servicecatgeory = val;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                            labelText: "Provider Name*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                            labelText: "Email*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "Contact No.*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "Provider Number*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),

//                       ],
//                     ),
//                   ),
//                   SizedBox(height:5),
//                    Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
//                                     child: ExpansionTile(
//                       expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
//                       title: TextWidget(
//                         text: "Invoice Detail",
//                         textSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: [
//                         Divider(height: 5),

//                         SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                            labelText: "Invoice Number*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child:
//                         TextWidget(text:"Date*"),),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "Date",
//                               hintText: "Date",
//                             controller: dateCtl,
//                               suffixIcon: Icon(Icons.calendar_today),
//                             onTap: () async {
//                               DateTime date = DateTime(1900);
//                               FocusScope.of(context).requestFocus(new FocusNode());

//                               date = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(1900),
//                                   lastDate: DateTime(2100));
//                               var x = date.toIso8601String().substring(0, 10);
//                               dateCtl.text = x;
//                             },
//                           ),
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(

//                             labelText: "Amuount*",
//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),

//                       ],
//                   ),
//                    ),
//                    SizedBox(height:5),
//                    Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
//                      child: ExpansionTile(
//                       expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
//                       title: TextWidget(
//                         text: "Bank Details",
//                         textSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: [
//                          Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child:
//                         TextWidget(text:"Bank Detail Of*"),),
//                         RadioListTile(
//                           value: Ans.Yes,
//                           groupValue: _ans,
//                           onChanged: (value) {
//                             setState(() {
//                                _ans = value;
//                             });

//                           },
//                           title: TextWidget(text:"Member"),
//                           //selectedTileColor: Constant.primary,
//                         ),
//                         RadioListTile(
//                           value: Ans.No,
//                           groupValue: _ans,
//                           onChanged: (value) {
//                             setState(() {
//                                _ans = value;
//                             });
//                           },
//                           title: TextWidget(text:"Partner"),
//                           // selectedTileColor: Constant.primary,
//                         ),
//                          Padding(
//                           padding: const EdgeInsets.only(left:8.0),
//                           child:
//                         TextWidget(text:"Account Type*"),),
//                         RadioListTile(
//                           value: Ans.Yes,
//                           groupValue: _ans1,
//                           onChanged: (value) {
//                             setState(() {
//                                _ans1 = value;
//                             });
//                           },
//                           title: TextWidget(text:"Single"),
//                           //selectedTileColor: Constant.primary,
//                         ),
//                         RadioListTile(
//                           value: Ans.No,
//                           groupValue: _ans1,
//                           onChanged: (value) {
//                            setState(() {
//                                _ans1 = value;
//                             });
//                           },
//                           title: TextWidget(text:"Joint"),
//                           // selectedTileColor: Constant.primary,
//                         ),
//                         Divider(height: 5),

//                         SizedBox(height: 10),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "Account Owner*",

//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "BSB*",

//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                             labelText: "Account Name / Account Type *",

//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormWidget(
//                              labelText: "Account No *",

//                             onChanged: (value) {
//                               location = value;
//                             },
//                           ),
//                         ),
//                          Container(
//                           height: 50,
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             border: Border.all(
//                                 // color: GlobalVars.accentColor,
//                                 ),
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           child: Center(
//                               child: TextWidget(
//                             text: "Your Account Balance",
//                             color: Colors.white,
//                             textSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ))),
//                       SizedBox(height: 10),
//                       Card(
//                         color: Colors.green[200],
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               TextWidget(
//                                 text: "\$3566.01",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange[700],
//                               ),
//                               SizedBox(height: 5),
//                               TextWidget(
//                                 text: "Available Now",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Card(
//                         color: Colors.green[200],
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               TextWidget(
//                                 text: "\$0.00",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange[700],
//                               ),
//                               SizedBox(height: 5),
//                               TextWidget(
//                                 text: "Available Hold",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Card(
//                         color: Colors.green[200],
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               TextWidget(
//                                 text: "\$3566.01",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.orange[700],
//                               ),
//                               SizedBox(height: 5),
//                               TextWidget(
//                                 text: "Total Available ",
//                                 textSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),

//                       ],
//                   ),
//                    ),

//                 ],
//               ),
//             ), SizedBox(height:20),
//              ButtonWidget(
//                       text: 'Generate',
//                       onPressed: () {
//                         return showDialog(
//                               context: context,
//                               builder: (context) => new AlertDialog(
//                                 content: TextWidget(text:'Do you want to book ?',textSize: 18,),
//                                 actionsPadding:
//                                     EdgeInsets.only(left: 30, right: 30),
//                                 actions: <Widget>[
//                                   GestureDetector(
//                                     onTap: () => Navigator.of(context).pop(false),
//                                     child: TextWidget(text:
//                                       "Cancel",
//                                       textSize: 14,
//                                       // style: TextStyle(
//                                       //     color: Theme.of(context).accentColor,
//                                       //     fontSize: 14.0,
//                                       //     fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   SizedBox(width: 20),
//                                   //SizedBox(width: MediaQuery.of(context).size.width*.35),
//                                   GestureDetector(
//                                     onTap: () => Navigator.of(context)
//                                         .pushReplacementNamed('/home'),
//                                     child: TextWidget(text:
//                                       "Yes",
//                                       textSize: 14,
//                                       // style: TextStyle(
//                                       //     color: Theme.of(context).accentColor,
//                                       //     fontSize: 14.0,
//                                       //     fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ) ??
//                             false;
//                       })
//           ],
//         ),
//       ),
//     ));
//   }
// }
