import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class NonPrefPartner extends StatefulWidget {
  @override
  _NonPrefPartnerState createState() => _NonPrefPartnerState();
}

class _NonPrefPartnerState extends State<NonPrefPartner> {
  String _selectedText;
  TextEditingController dateCtl;

  String formattedStr;
  String email;
  String business;
  String address,abn,mobile,providerName,providerNumber,invoiceNumber,invoiceAmount;

  @override
  void initState() {
    // TODO: implement initState
    dateCtl = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    dateCtl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TopWidget(text: "Non Preferred Partner\n         Invoice"),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextWidget(
                          text: "Member Name",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            width: MediaQuery.of(context).size.width * .40,
                            height: MediaQuery.of(context).size.height * .06,
                            decoration: BoxDecoration(
                                color: GlobalVars.primaryColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                dropdownColor: GlobalVars.primaryColor,
                                hint: TextWidget(
                                  text: "Member Name ",
                                  color: Colors.white,
                                ),
                                value: _selectedText,
                                items: <String>[
                                  'Select Member',
                                  'Peter Georg',
                                  'Jack Mark',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: TextWidget(
                                      text: value,
                                      color: Colors.white,
                                    ),
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
                    Column(
                      children: [
                        TextWidget(
                          text: "Date",
                          textSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8),
                        BoxTextFormWidgett(
                          width: size.width * .42,
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
                  text: "Business Details",
                  textAlign: TextAlign.start,
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Name of Business",
                  onChanged: (value) {
                    business = value;
                  },
                ),
                SizedBox(
                  height: 5,
                  
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Address",
                  onChanged: (value) {
                    address = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewTextWidget(text: "ABN"),
                      BoxTextFormWidgett(
                        hintText: "",
                        width: size.width * .60,
                        onChanged: (value) {
                          abn = value;
                        },
                      ),
                    ]),
                SizedBox(
                  height: 5,
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Contact Number",
                  onChanged: (value) {
                    mobile = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                TextWidget(
                  text: "Provider Details",
                  textAlign: TextAlign.start,
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Name of Provider",
                  onChanged: (value) {
                    providerName = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                BoxTextFormWidgett(
                  width: size.width * .80,
                  hintText: "Provider Number",
                  onChanged: (value) {
                    providerNumber = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                TextWidget(
                  text: "Invoice Details",
                  textAlign: TextAlign.start,
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Invoice Number",
                      onChanged: (value) {
                        invoiceNumber = value;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    BoxTextFormWidgett(
                      width: size.width * .40,
                      hintText: "Invoice Amount \$:",
                      onChanged: (value) {
                        invoiceAmount = value;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget(text: "Upload Invoice", onPressed: () {}),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextWidget(
                        text:
                            "Non-Preferred Partner processing fee applies \n 10% of invoice amount capped at \$200"),
                    TextWidget(
                        text:
                            "Fee will be added to the invoice and deducted \nfrom your account balance before invoice is paid"),
                    TextWidget(
                        text:
                            "If the balance is your account is less than the \n total of the invoice amount and processing fees"),
                    TextWidget(text: "the invoice will not be paid.")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(text: "Upload Bank Details", onPressed: () {}),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(text: "Accept and Proceed", onPressed: () {}),
                SizedBox(
                  height: 10,
                ),
                DashLogout()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
