import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/OtionTab.dart';
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
                      OptionTab(
                          tabText: "Issue\nGift",
                          icon: Icons.card_giftcard,
                          onPressed: (){
                            Navigator.pushNamed(context, '/issue-gift');
                          }),
                      OptionTab(
                          tabText: "Gift\nHistory",
                          icon: FontAwesomeIcons.gifts,
                          onPressed: (){
                            Navigator.pushNamed(context, '/receive-gift');
                          }),
                    ],
                  ),
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
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Gift of Health",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Gift Received",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
