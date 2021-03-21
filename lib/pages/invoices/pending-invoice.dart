import 'package:flutter/material.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/text_widget.dart';

class PendingInvoice extends StatefulWidget {
  @override
  _PendingInvoiceState createState() => _PendingInvoiceState();
}

class _PendingInvoiceState extends State<PendingInvoice> {
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
                    color: Color(0xFF3a1172),
                    border: Border.all(
                      color: Color(0xFF3a1172),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                      child: TextWidget(
                    text: "Invoice",
                    color: Colors.white,
                    textSize: 18,
                    fontWeight: FontWeight.bold,
                  ))),
              Card(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Row(
                    children: <Widget>[
                      Expanded(child: TextWidget(text: 'Sr.No.1')),
                      Text(
                        'INVA0001',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'IFC NO'),
                                TextWidget(text: "IFCA0001")
                              ]),
                          DividerWidget(
                            
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'Member'),
                                TextWidget(text: 'Peter Goerg (01000002)')
                              ]),
                          DividerWidget(
                           
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Partner"),
                                TextWidget(text: 'A2ZDental')
                              ]),
                          DividerWidget(
                            
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Service"),
                                TextWidget(text: 'Dental')
                              ]),
                          DividerWidget(),
                        
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Invoice Amount"),
                                TextWidget(text: "\$35.00")
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Preferred Date"),
                                TextWidget(text: '05-03-2019 06:30')
                              ]),
                         DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Action"),
                                TextWidget(text: 'Completed')
                              ]),
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
                      Expanded(child: TextWidget(text: 'Sr.No.2')),
                      Text(
                        'INVA0002',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'IFC NO'),
                                TextWidget(text: "IFCA0002")
                              ]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: 'Member')]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Partner")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Service")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [
                            TextWidget(text: "Invoice Amount"),
                          ]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Preferred Date")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Action")]),
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
                      Expanded(child: TextWidget(text: 'Sr.No 3')),
                      Text(
                        'INVA0003',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: 'IFC NO')]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: 'Member')]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Partner")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Service")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [
                            TextWidget(text: "Invoice Amount"),
                          ]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Preferred Date")]),
                          Divider(
                            height: 5,
                          ),
                          Row(children: [TextWidget(text: "Action")]),
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
