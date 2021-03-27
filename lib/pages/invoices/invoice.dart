import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/widgets/OtionTab.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Pending\nInvoice",
                          icon: FontAwesomeIcons.fileInvoice,
                          onPressed: (){
                            Navigator.pushNamed(context, '/pending-invoice');
                          }),
                      OptionTab(
                          tabText: "Gap-Paid",
                          icon: FontAwesomeIcons.fileInvoiceDollar,
                          onPressed: (){
                            Navigator.pushNamed(context, '/gap-history');
                          }),
                    ],
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionTab(
                          tabText: "Invoice\nHistory",
                          icon: FontAwesomeIcons.history,
                          onPressed: (){
                            Navigator.pushNamed(context, '/pending-invoice');
                          }),
                      OptionTab(
                          tabText: "Non\nPartner",
                          icon: FontAwesomeIcons.handshake,
                          onPressed: (){
                            Navigator.pushNamed(context, '/non-partner');
                          }),
                    ],
                  ),
                ])));
  }
}
