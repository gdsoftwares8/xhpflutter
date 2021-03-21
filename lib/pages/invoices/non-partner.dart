import 'package:flutter/material.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

enum Ans { Yes, No }

class NonPartner extends StatefulWidget {
  @override
  _NonPartnerState createState() => _NonPartnerState();
}

class _NonPartnerState extends State<NonPartner> {
  String _savedbusiness;
  String _savedmember;
  String _servicecatgeory;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  String location;
  Ans _ans;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Card(
          child: ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            initiallyExpanded: true,
            title: Row(children: <Widget>[
              Expanded(
                child: Container(
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
                      text: "Non Partner Invoice",
                      color: Colors.white,
                      textSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
              )
            ]),
            children: [
              Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: TextWidget(
                    text: "Business Detail",
                    textSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    Divider(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextWidget(
                        text: "Select Saved Business*",
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
                            hint: TextWidget(text: "Other"),
                            value: _savedbusiness,
                            items: <String>['XYZ', 'ABC'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: TextWidget(text: value),
                              );
                            }).toList(),
                            onChanged: (String val) {
                              setState(() {
                                _savedbusiness = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Business Name*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "ABN No*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Address*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "City*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "State*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "PostCode*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:5),
              Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
                child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: TextWidget(
                    text: "Non Partner Detail",
                    textSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    Divider(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextWidget(
                        text: "Member*",
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
                            hint: TextWidget(text: "Select Member"),
                            value: _savedmember,
                            items: <String>['XYZ', 'ABC'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: TextWidget(text: value),
                              );
                            }).toList(),
                            onChanged: (String val) {
                              setState(() {
                                _savedmember = val;
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
                      child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            hint: TextWidget(text: "Select Category"),
                            value: _servicecatgeory,
                            items: <String>['XYZ', 'ABC'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: TextWidget(text: value),
                              );
                            }).toList(),
                            onChanged: (String val) {
                              setState(() {
                                _servicecatgeory = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Provider Name*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Email*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Contact No.*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Provider Number*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                   
                  ],
                ),
              ),
              SizedBox(height:5),
               Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
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
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Invoice Number*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: 
                    TextWidget(text:"Date*"),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: dateCtl,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today),
                          labelText: "Date",
                          hintText: "Date",
                        ),
                        onTap: () async {
                          DateTime date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

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
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Amuount*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    
                  ],
              ),
               ),
               SizedBox(height:5),
               Container(decoration: BoxDecoration(border: Border.all(color:Color(0xFF3a1172),)),
                 child: ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  title: TextWidget(
                    text: "Bank Details",
                    textSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: 
                    TextWidget(text:"Bank Detail Of*"),),
                    RadioListTile(
                      value: Ans.Yes,
                      groupValue: _ans,
                      onChanged: (value) {
                        _ans = value;
                      },
                      title: TextWidget(text:"Member"),
                      //selectedTileColor: Constant.primary,
                    ),
                    RadioListTile(
                      value: Ans.No,
                      groupValue: _ans,
                      onChanged: (value) {
                        _ans = value;
                      },
                      title: TextWidget(text:"Partner"),
                      // selectedTileColor: Constant.primary,
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: 
                    TextWidget(text:"Account Type*"),),
                    RadioListTile(
                      value: Ans.Yes,
                      groupValue: _ans,
                      onChanged: (value) {
                        _ans = value;
                      },
                      title: TextWidget(text:"Single"),
                      //selectedTileColor: Constant.primary,
                    ),
                    RadioListTile(
                      value: Ans.No,
                      groupValue: _ans,
                      onChanged: (value) {
                        _ans = value;
                      },
                      title: TextWidget(text:"Joint"),
                      // selectedTileColor: Constant.primary,
                    ),
                    Divider(height: 5),
                   
                    
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText:"Enter Account Owner/s",
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Account Owner*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "BSB*",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Account Name / Account Type *",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          labelText: "Account No *",
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
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
                            // color: Color(0xFF3a1172),
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
      ),
    ));
  }
}
