import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/text_widget.dart';

class GapHistory extends StatefulWidget {
  @override
  _GapHistoryState createState() => _GapHistoryState();
}

class _GapHistoryState extends State<GapHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Gap History",
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
                      Expanded(child: TextWidget(text: 'Invoice No')),
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
                                TextWidget(text: "Date"),

                                TextWidget(text: '05-03-2019 06:30')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'Partner'),
                                TextWidget(text: 'Dr. Abraham Zacharia)')
                              ]),
                          Divider(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'IFC NO'),
                                TextWidget(text: "IFCA0001")
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
                                TextWidget(text: "Gap Amount"),
                                TextWidget(text: '\$0.00')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Type"),
                                TextWidget(text: 'DEBIT')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Status"),
                                TextWidget(text: 'Not Received Amount')
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
                      Expanded(child: TextWidget(text: 'Invoice No')),
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
                                TextWidget(text: "Date"),
                                TextWidget(text: '05-03-2019 06:30')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'Partner'),
                                TextWidget(text: 'Dr. Abraham Zacharia')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'IFC NO'),
                                TextWidget(text: "IFCA0002")
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
                                TextWidget(text: "Gap Amount"),
                                TextWidget(text: '\$0.00')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Type"),
                                TextWidget(text: 'DEBIT')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Status"),
                                TextWidget(text: 'Not Received Amount')
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
                      Expanded(child: TextWidget(text: 'Invoice No')),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Date"),
                                TextWidget(text: '05-03-2019 06:30')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'Partner'),
                                TextWidget(text: 'Dr. Abraham Zacharia')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: 'IFC NO'),
                                TextWidget(text: "IFCA0003")
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
                                TextWidget(text: "Gap Amount"),
                                TextWidget(text: '\$0.00')
                              ]),
                          DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Type"),
                                TextWidget(text: 'DEBIT')
                              ]),
                          Divider(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Transfer Status"),
                                TextWidget(text: 'Not Received Amount')
                              ]),
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
