import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/text_widget.dart';

class Gift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          width: MediaQuery.of(context).size.width * .40,
                          height: MediaQuery.of(context).size.height * .25,
                          margin: EdgeInsets.all(10),
                          // padding: EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/issue-gift');
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: GlobalVars.accentColor,

                              elevation: 10,
                              child: Stack(
                                  //  textDirection: TextDirection.ltr,
                                  //  alignment: AlignmentDirectional.center,
                                  children: [
                                    Center(
                                        child: Icon(Icons.card_giftcard,
                                      size: 60,
                                      color: Colors.white,
                                    )),
                                    Positioned(
                                        bottom: 0,
                                        child: Center(
                                            child: TextWidget(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          textAlign: TextAlign.center,
                                          text: "Issue\nGift",
                                          // softWrap: true,
                                          maxLines:2,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          textSize: 20,
                                        ))),
                                  ]),
                              //Center(child: TextWidget(text:"Pending Invoice",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          width: MediaQuery.of(context).size.width * .40,
                          height: MediaQuery.of(context).size.height * .25,
                          margin: EdgeInsets.all(10),
                          // padding: EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/receive-gift');
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: GlobalVars.accentColor,
                              elevation: 10,
                              child: Stack(
                                  //  textDirection: TextDirection.ltr,
                                  //  alignment: AlignmentDirectional.center,
                                  children: [
                                    Center(
                                        child: FaIcon(
                                      FontAwesomeIcons.gifts,
                                      size: 60,
                                      color: Colors.white,
                                    )),
                                    Positioned(
                                        bottom: 0,
                                        child: Center(
                                            child: TextWidget(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          textAlign: TextAlign.center,
                                          text: "Gift\nHistory",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          textSize: 20,
                                        ))),
                                  ]),
                              //Center(child: TextWidget(text:"Pending Invoice",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                            ),
                          ),
                        ),
                      ],
                    ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15)),
                  //   width: MediaQuery.of(context).size.width * .80,
                  //   height: MediaQuery.of(context).size.height * .20,
                  //   margin: EdgeInsets.all(20),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, '/issue-gift');
                  //     },
                  //     child: Card(
                  //         color: GlobalVars.accentColor,
                  //         elevation: 10,
                  //         child: Center(
                  //             child: TextWidget(
                  //           text: "Issue Gift",
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           textSize: 20,
                  //         ))),
                  //   ),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15)),
                  //   width: MediaQuery.of(context).size.width * .80,
                  //   height: MediaQuery.of(context).size.height * .20,
                  //   margin: EdgeInsets.all(20),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, "/receive-gift");
                  //     },
                  //     child: Card(
                  //         color: GlobalVars.accentColor,
                  //         elevation: 10,
                  //         child: Center(
                  //             child: TextWidget(
                  //           text: "Gift History",
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           textSize: 20,
                  //         ))),
                  //   ),
                  // )
                ])));
  }
}

class IssueGift extends StatefulWidget {
  @override
  _IssueGiftState createState() => _IssueGiftState();
}

class _IssueGiftState extends State<IssueGift> {
  String name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: GlobalVars.accentColor,
                        border: Border.all(
                          color: GlobalVars.accentColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                          child: TextWidget(
                        text: "Gift of Health",
                        color: Colors.white,
                        textSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Send Gift to Person*",
                      //style: Constant.heading,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormWidget(
                     labelText: "Enter Name",
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Send Gift to Email*",
                      //style: Constant.heading,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormWidget(
                      labelText: "Enter Email",
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Gift Amount *",
                      //style: Constant.heading,
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormWidget(
                      labelText: "Enter Amount",
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
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
                        textSize: 18,
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
                            textSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700],
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text: "Available Now",
                            textSize: 20,
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
                            textSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700],
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text: "Available Hold",
                            textSize: 20,
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
                            textSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700],
                          ),
                          SizedBox(height: 5),
                          TextWidget(
                            text: "Total Available ",
                            textSize: 20,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class GiftReceive extends StatefulWidget {
  @override
  _GiftReceiveState createState() => _GiftReceiveState();
}

class _GiftReceiveState extends State<GiftReceive> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: GlobalVars.accentColor,
                    border: Border.all(
                      color: GlobalVars.accentColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: TextWidget(
                    text: "Gift Received",
                    color: Colors.white,
                    textSize: 18,
                    fontWeight: FontWeight.bold,
                  ))),
              Card(
                              child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text('Peter George')),
                      Text(
                        '#101',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                         Row(children: [Text('Amount')]),
                         DividerWidget(),
                      Row(children: [Text('Coupon Code')]),
                      DividerWidget(),
                      Row(children: [Text("Gift Balance Amount")]),
                      DividerWidget(),
                      Row(children: [Text("Expiry Date")]),
                      DividerWidget(),
                      Row(children: [Text("Status")]),
                      DividerWidget(),
                        ],
                      ),
                    )
                  ],
                ),
                
              ),
              Card(
                              child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text('Harry Paul')),
                      Text(
                        '#102',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                        Row(children: [Text('Amount')]),
                         DividerWidget(),
                      Row(children: [Text('Coupon Code')]),
                      DividerWidget(),
                      Row(children: [Text("Gift Balance Amount")]),
                      DividerWidget(),
                      Row(children: [Text("Expiry Date")]),
                      DividerWidget(),
                      Row(children: [Text("Status")]),
                      DividerWidget(),
                        ],
                      ),
                    )
                  ],
                ),
                
              ),
              Card(
                              child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text('Ben Mark')),
                      Text(
                        '#103',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                        Row(children: [Text('Amount')]),
                         DividerWidget(),
                      Row(children: [Text('Coupon Code')]),
                      DividerWidget(),
                      Row(children: [Text("Gift Balance Amount")]),
                      DividerWidget(),
                      Row(children: [Text("Expiry Date")]),
                      DividerWidget(),
                      Row(children: [Text("Status")]),
                      DividerWidget(),
                        ],
                      ),
                    )
                  ],
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
