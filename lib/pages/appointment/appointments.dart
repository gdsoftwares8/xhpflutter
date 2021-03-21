import 'package:flutter/material.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
            
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, "/book-appointment");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .20,
                      margin: EdgeInsets.all(20),
                      child: Card(
                          color: Color(0xFF522B83).withOpacity(0.85),
                          elevation: 10,
                          child: Center(
                              child: TextWidget(
                            text: "Book Appointment",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textSize: 20,
                          ))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/book-history");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      width: MediaQuery.of(context).size.width * .80,
                      height: MediaQuery.of(context).size.height * .20,
                      margin: EdgeInsets.all(20),
                      child: Card(
                          color: Color(0xFF522B83).withOpacity(0.85),
                          elevation: 10,
                          child: Center(
                              child: TextWidget(
                            text: "Appointment History",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textSize: 20,
                          ))),
                    ),
                  )
                ])));
  }
}

enum Ans { Yes, No }

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  String _selectedText;
  String _selectedText2;
  String _selectedText3;
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
          child: Card(margin: EdgeInsets.all(5),
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
                        text: "Book Appointment",
                        color: Colors.white,
                        textSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextWidget(text:
                      "Member*",
                      //style: Constant.heading,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          hint: TextWidget(text:"Select Member"),
                          value: _selectedText,
                          items: <String>['Peter Goerg', 'Patrica Goerg']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: TextWidget(text:value),
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
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        labelText: "Location / Postcode*",
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      onChanged: (value) {
                        location = value;
                      },
                    ),
                  ),)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextWidget(text:"Service Category*"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      hint: TextWidget(text:"Select Service category"),
                      value: _selectedText2,
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
                          child: TextWidget(text:value),
                        );
                      }).toList(),
                      onChanged: (String val) {
                        setState(() {
                          _selectedText2 = val;
                        });
                      },
                    ),
                  ))),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextWidget(text:"Service Provider*"),),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: _selectedText3,
                      hint: TextWidget(text:"Select Service Provider"),
                      items: <String>[
                        'One',
                        'Two',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: TextWidget(text:value),
                        );
                      }).toList(),
                      onChanged: (String val) {
                        setState(() {
                          _selectedText3 = val;
                        });
                      },
                    ),
                  ),)),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: 
                  TextWidget(text:"Preferred Date*"),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: dateCtl,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText: "Date",
                        hintText: "Preferred Date",
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
                  ),)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: TextWidget(text:"Select Time (24 hr Clock)*"),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: timeCtl, // add this line.
                      decoration: InputDecoration(
                        labelText: 'Time*',
                      ),
                      onTap: () async {
                        TimeOfDay time = TimeOfDay.now();
                        FocusScope.of(context).requestFocus(new FocusNode());

                        TimeOfDay picked = await showTimePicker(
                            context: context, initialTime: time);
                        if (picked != null && picked != time) {
                          timeCtl.text = picked
                              .toString()
                              .substring(10, 15); // add this line.
                          setState(() {
                            time = picked;
                          });
                        }
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'cant be empty';
                        }
                        return null;
                      },
                    ),
                  ),)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: 
                  TextWidget(text:"Do you want use your extras health cover ?*"),),
                  RadioListTile(
                    value: Ans.Yes,
                    groupValue: _ans,
                    onChanged: (value) {
                      _ans = value;
                    },
                    title: TextWidget(text:"Yes"),
                    //selectedTileColor: Constant.primary,
                  ),
                  RadioListTile(
                    value: Ans.No,
                    groupValue: _ans,
                    onChanged: (value) {
                      _ans = value;
                    },
                    title: TextWidget(text:"No"),
                    // selectedTileColor: Constant.primary,
                  ),
                  SizedBox(height: 20),
                  ButtonWidget(
                      text: 'Book Appointment',
                      onPressed: () {
                        return showDialog(
                              context: context,
                              builder: (context) => new AlertDialog(
                                content: TextWidget(text:'Do you want to book ?',textSize: 18,),
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

