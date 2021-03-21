import 'package:flutter/material.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/text_widget.dart';

class AppointmentHistory extends StatefulWidget {
  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
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
                    text: "Appointment History",
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
                        'Peter Goerg (01000002)',
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
                                TextWidget(text: 'Business Name'),
                                TextWidget(text: "A2ZDental")
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
                                TextWidget(text: "Service"),
                                TextWidget(text: 'Dental')
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
                                TextWidget(text: "Status"),
                                TextWidget(text: 'Completed')
                              ]),
                              DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Follow Up Appointment"),
                                TextWidget(text: '-')
                              ]),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "IFC Status"),
                                TextWidget(text: 'IFCA0001')
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
                        'Peter Goerg (01000002)',
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
                                TextWidget(text: 'Business Name'),
                                TextWidget(text: "A2ZDental")
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
                                TextWidget(text: "Service"),
                                TextWidget(text: 'Dental')
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
                                TextWidget(text: "Status"),
                                TextWidget(text: 'Completed')
                              ]),
                              DividerWidget(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "Follow Up Appointment"),
                                TextWidget(text: '-')
                              ]),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: "IFC Status"),
                                TextWidget(text: 'IFCA0001')
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
