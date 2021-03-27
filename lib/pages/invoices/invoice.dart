import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        width: MediaQuery.of(context).size.width * .40,
                        height: MediaQuery.of(context).size.height * .25,
                        margin: EdgeInsets.all(10),
                        // padding: EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/pending-invoice');
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
                                    FontAwesomeIcons.fileInvoice,
                                    size: 60,
                                    color: Colors.white,
                                  )),
                                  Positioned(
                                      bottom: 0,
                                      child: Center(
                                          child: TextWidget(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        textAlign: TextAlign.justify,
                                        text: "Pending\nInvoice",
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
                            Navigator.pushNamed(context, '/gap-history');
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
                                    FontAwesomeIcons.fileInvoiceDollar,
                                    size: 60,
                                    color: Colors.white,
                                  )),
                                  Positioned(
                                      bottom: 20,
                                      child: Center(
                                          child: TextWidget(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        textAlign: TextAlign.center,
                                        text: "Gap-Paid",
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
                            Navigator.pushNamed(context, '/pending-invoice');
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
                                    FontAwesomeIcons.history,
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
                                        text: "Invoice\nHistory",
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
                            Navigator.pushNamed(context, '/non-partner');
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
                                    FontAwesomeIcons.handshake,
                                    size: 60,
                                    color: Colors.white,
                                  )),
                                  Positioned(
                                      bottom: 0,
                                      child: Center(
                                          child: TextWidget(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        textAlign: TextAlign.justify,
                                        text: "   Non\nPartner",
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
                                 ])));
  }
}
