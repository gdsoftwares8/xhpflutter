import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xhp/blocs/ChuckGiftsSendbloc.dart';
import 'package:xhp/blocs/ChuckGiftsbloc.dart';
import 'package:xhp/models/gift.dart';
import 'package:xhp/models/gift_responce.dart';
import 'package:xhp/models/gift_send_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/OtionTab.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/issue-gift');
                          }),
                      OptionTab(
                          tabText: "Gift\nHistory",
                          icon: FontAwesomeIcons.gifts,
                          onPressed: () {
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
  ChuckGiftSendbloc _bloc;
  String name;
  String memberId;
  String email;
  String amount;
  bool _loading = false;

  listenStream() {
    _bloc.chuckListStream.listen((Response<GiftSendResponse> event) {
      GlobalFunc.logPrint("Login listen ${event.message}");
      switch (event.status) {
        case Status.LOADING:
          GlobalFunc.logPrint(event.message);
          updateLoadingState(true);
          break;
        case Status.COMPLETED:
          GlobalFunc.logPrint(" Success ${event.data}");
          updateLoadingState(false);
          if (event.data.result != null) {
            //GlobalFunc.saveUserData(event.data.resultcontext);
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
          } else {
            GlobalFunc.showToast("Error:- " + event.message);
          }
          break;
        case Status.ERROR:
          updateLoadingState(false);
          GlobalFunc.showToast(event.message);
          break;
      }
    }, onError: (error) {
      print("Error $error");
    }, onDone: () {
      print("Stream closed!");
    });
  }

  @override
  void initState() {
    super.initState();
    _bloc = ChuckGiftSendbloc();
    listenStream();
  }

  @override
  void dispose() {
    _bloc.dispose(); //Streams must be closed when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Gift of Health",
            onPressed: () {
              Navigator.pop(context);
            }),
        body: _loading
            ? GlobalFunc.ProgressBar()
            : SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Card(
                      elevation: 5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Member ID*",
                                //style: Constant.heading,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormWidget(
                                labelText: "Enter Member ID",
                                onChanged: (value) {
                                  memberId = value;
                                },
                              ),
                            ),
                            SizedBox(height: 5),
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
                                  email = value;
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
                                  amount = value;
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                          ]),
                    ),
                    SizedBox(height: 20),
                    ButtonWidget(
                        text: 'Send Gift',
                        onPressed: () {
                          return showDialog(
                                context: context,
                                builder: (context) => new AlertDialog(
                                  content: TextWidget(
                                    text: 'Do you want to send ?',
                                    textSize: 18,
                                  ),
                                  actionsPadding:
                                      EdgeInsets.only(left: 30, right: 30),
                                  actions: <Widget>[
                                    GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pop(false),
                                      child: TextWidget(
                                        text: "Cancel",
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
                                      onTap: () {
                                        _bloc.fetchGiftSend(name, memberId, email, amount);

                                        Fluttertoast.showToast(
                                          msg: "Gift Send Successfully!",
                                        );
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      },
                                      child: TextWidget(
                                        text: "Yes",
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
                        }),
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
                  ],
                ),
              ),
      ),
    );
  }

  updateLoadingState(bool loading) {
    setState(() {
      this._loading = loading;
    });
  }
}

class GiftReceive extends StatefulWidget {
  @override
  _GiftReceiveState createState() => _GiftReceiveState();
}

class _GiftReceiveState extends State<GiftReceive> {
  ChuckGiftbloc _bloc;
  String memberId = "1";
  @override
  void initState() {
    super.initState();
    _bloc = ChuckGiftbloc(memberId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Gift Received",
            onPressed: () {
              Navigator.pop(context);
            }),
        body: StreamBuilder<Response<GiftResponce>>(
          stream: _bloc.chuckListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              GlobalFunc.logPrint("snapshot $snapshot");
              switch (snapshot.data.status) {
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                  // return CategoryList(categoryList: snapshot.data.data);
                  GiftResponce res = snapshot.data.data;
                  if (res.status == 1) {
                    GlobalFunc.logPrint(
                        "total gifts ${res.result.received.length}");
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return drawItem(res.result.send[index]);
                      },
                      itemCount: res.result.send.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchGifts(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchGifts(memberId),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget drawItem(GiftModel model) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: Text(model.receiverName)),
            Text(
              "${model.idGift}",
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
                      Text('Amount'),
                      TextWidget(text: "${model.giftAmount}")
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Coupon Code'),
                      TextWidget(text: "${model.couponCode}")
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gift Balance Amount"),
                      TextWidget(text: "${model.giftAmountAvailable}")
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expiry Date"),
                      TextWidget(text: "${model.giftExpiryDate}")
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status"),
                      TextWidget(text: "${model.status}")
                    ]),
                DividerWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:xhp/blocs/ChuckGiftsSendbloc.dart';
// import 'package:xhp/blocs/ChuckGiftsbloc.dart';
// import 'package:xhp/models/gift.dart';
// import 'package:xhp/models/gift_responce.dart';
// import 'package:xhp/models/gift_send_response.dart';
// import 'package:xhp/networking/Response.dart';
// import 'package:xhp/utils/GlobalFuncs.dart';
// import 'package:xhp/widgets/DividerWidget.dart';
// import 'package:xhp/widgets/Error.dart';
// import 'package:xhp/widgets/GlobalWidgets.dart';
// import 'package:xhp/widgets/Loading.dart';
// import 'package:xhp/widgets/OtionTab.dart';
// import 'package:xhp/widgets/TextForm.dart';
// import 'package:xhp/widgets/button_widget.dart';
// import 'package:xhp/widgets/text_widget.dart';

// class Gift extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: <Widget>[
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       OptionTab(
//                           tabText: "Issue\nGift",
//                           icon: Icons.card_giftcard,
//                           onPressed: (){
//                             Navigator.pushNamed(context, '/issue-gift');
//                           }),
//                       OptionTab(
//                           tabText: "Gift\nHistory",
//                           icon: FontAwesomeIcons.gifts,
//                           onPressed: (){
//                             Navigator.pushNamed(context, '/receive-gift');
//                           }),
//                     ],
//                   ),
//                 ])));
//   }
// }

// class IssueGift extends StatefulWidget {
//   @override
//   _IssueGiftState createState() => _IssueGiftState();
// }

// class _IssueGiftState extends State<IssueGift> {
//   ChuckGiftSendbloc _bloc;
// String name;
//   String memberId;
//   String email;
//   String amount;
//   bool _loading =false;

//   listenStream() {
//     _bloc.chuckListStream.listen((Response<GiftSendResponse> event) {

//       GlobalFunc.logPrint("Login listen ${event.message}");
//       switch(event.status) {
//         case Status.LOADING:
//           GlobalFunc.logPrint(event.message);
//           updateLoadingState(true);
//           break;
//         case Status.COMPLETED:
//           GlobalFunc.logPrint(" Success ${event.data}");
//           updateLoadingState(false);
//           if(event.data.result!=null) {

//             //GlobalFunc.saveUserData(event.data.resultcontext);
//             Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
//           } else {
//             GlobalFunc.showToast("Error:- "+event.message);
//           }
//           break;
//         case Status.ERROR:
//           updateLoadingState(false);
//           GlobalFunc.showToast(event.message);
//           break;
//       }

//     }, onError: (error){
//       print("Error $error");
//     }, onDone: () {
//       print("Stream closed!");
//     });
//   }
//    @override
//   void initState() {
//     super.initState();
//     _bloc = ChuckGiftSendbloc(name, memberId, email, amount);
//     listenStream();

//   }

//   @override
//   void dispose() {
//     _bloc.dispose(); //Streams must be closed when not needed
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: GlobalWidgets.getToolbarWithBack(
//             title: "Gift of Health",
//             onPressed: (){
//               Navigator.pop(context);
//             }),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//                SizedBox(height:10),
//               Card(elevation: 5,
//                                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                        SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           "Member ID*",
//                           //style: Constant.heading,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormWidget(
//                           labelText: "Enter Member ID",
//                           onChanged: (value) {
//                             memberId = value;
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           "Send Gift to Person*",
//                           //style: Constant.heading,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormWidget(
//                           labelText: "Enter Name",
//                           onChanged: (value) {
//                             name = value;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           "Send Gift to Email*",
//                           //style: Constant.heading,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormWidget(
//                           labelText: "Enter Email",
//                           onChanged: (value) {
//                             email = value;
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Text(
//                           "Gift Amount *",
//                           //style: Constant.heading,
//                         ),
//                       ),
//                       SizedBox(height: 5),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: TextFormWidget(
//                           labelText: "Enter Amount",
//                           onChanged: (value) {
//                             amount = value;
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 20),

//                     ]),
//               ),
//                SizedBox(height:20),
//               ButtonWidget(
//                   text: 'Send Gift',
//                   onPressed: () {
//                     return showDialog(
//                       context: context,
//                       builder: (context) => new AlertDialog(
//                         content: TextWidget(text:'Do you want to send ?',textSize: 18,),
//                         actionsPadding:
//                         EdgeInsets.only(left: 30, right: 30),
//                         actions: <Widget>[
//                           GestureDetector(
//                             onTap: () => Navigator.of(context).pop(false),
//                             child: TextWidget(text:
//                             "Cancel",
//                               textSize: 14,
//                               // style: TextStyle(
//                               //     color: Theme.of(context).accentColor,
//                               //     fontSize: 14.0,
//                               //     fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           //SizedBox(width: MediaQuery.of(context).size.width*.35),
//                           GestureDetector(
//                             onTap: () {
//                                 _bloc=ChuckGiftSendbloc(memberId, amount, name, email);

//                                 Fluttertoast.showToast(
//           msg: "Gift Send Successfully!",
//         );
//                               Navigator.of(context)
//                                 .pushReplacementNamed('/home');},
//                             child: TextWidget(text:
//                             "Yes",
//                               textSize: 14,
//                               // style: TextStyle(
//                               //     color: Theme.of(context).accentColor,
//                               //     fontSize: 14.0,
//                               //     fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ) ??
//                         false;
//                   })
// , SizedBox(height:20),

//                   Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.grey,
//                           border: Border.all(
//                             // color: GlobalVars.accentColor,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: Center(
//                             child: TextWidget(
//                               text: "Your Account Balance",
//                               color: Colors.white,
//                               textSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ))),
//                     SizedBox(height: 10),
//                     Card(
//                       color: Colors.green[200],
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             TextWidget(
//                               text: "\$3566.01",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.orange[700],
//                             ),
//                             SizedBox(height: 5),
//                             TextWidget(
//                               text: "Available Now",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Card(
//                       color: Colors.green[200],
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             TextWidget(
//                               text: "\$0.00",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.orange[700],
//                             ),
//                             SizedBox(height: 5),
//                             TextWidget(
//                               text: "Available Hold",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Card(
//                       color: Colors.green[200],
//                       elevation: 5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             TextWidget(
//                               text: "\$3566.01",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.orange[700],
//                             ),
//                             SizedBox(height: 5),
//                             TextWidget(
//                               text: "Total Available ",
//                               textSize: 20,
//                               fontWeight: FontWeight.bold,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   updateLoadingState(bool loading) {
//     setState(() {
//       this._loading = loading;
//     });
//   }

// }

// class GiftReceive extends StatefulWidget {
//   @override
//   _GiftReceiveState createState() => _GiftReceiveState();
// }

// class _GiftReceiveState extends State<GiftReceive> {
//   ChuckGiftbloc _bloc;
//   String memberId = "1";
//   @override
//   void initState() {
//     super.initState();
//     _bloc = ChuckGiftbloc(memberId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: GlobalWidgets.getToolbarWithBack(
//             title: "Gift Received",
//             onPressed: (){
//               Navigator.pop(context);
//             }),
//         body: StreamBuilder<Response<GiftResponce>>(
//           stream: _bloc.chuckListStream,
//           builder: (context, snapshot) {
//             if(snapshot.hasData) {
//               GlobalFunc.logPrint("snapshot $snapshot");
//               switch(snapshot.data.status){
//                 case Status.LOADING:
//                   return Loading(loadingMessage: snapshot.data.message);
//                   break;
//                 case Status.COMPLETED:
//                 // return CategoryList(categoryList: snapshot.data.data);
//                   GiftResponce res = snapshot.data.data;
//                   if(res.status == 1) {
//                     GlobalFunc.logPrint("total gifts ${res.result.received.length}");
//                     return ListView.builder(
//                       itemBuilder: (context, index) {
//                         return drawItem(res.result.send[index]);
//                       },
//                       itemCount: res.result.send.length,
//                       shrinkWrap: true,
//                       physics: ClampingScrollPhysics(),
//                     );
//                   } else {
//                     return Error(
//                       errorMessage: res.message,
//                       onRetryPressed: () => _bloc.fetchGifts(memberId),
//                     );
//                   }
//                   break;
//                 case Status.ERROR:
//                   return Error(
//                     errorMessage: snapshot.data.message,
//                     onRetryPressed: () => _bloc.fetchGifts(memberId),
//                   );
//                   break;
//               }
//             }
//             return Container();
//           },
//         ),
//       ),
//     );
//   }

//   Widget drawItem(GiftModel model) {
//     return Card(
//       child: ExpansionTile(
//         initiallyExpanded: true,
//         title: Row(
//           children: <Widget>[
//             Expanded(child: Text(model.receiverName)),
//             Text(
//               "${model.idGift}",
//               style: Theme.of(context).textTheme.caption,
//             ),
//           ],
//         ),
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Amount'),
//                       TextWidget(text: "${model.giftAmount}")
//                     ]
//                 ),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Coupon Code'),
//                       TextWidget(text: "${model.couponCode}")
//                     ]
//                 ),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Gift Balance Amount"),
//                       TextWidget(text: "${model.giftAmountAvailable}")
//                     ]
//                 ),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Expiry Date"),
//                       TextWidget(text: "${model.giftExpiryDate}")
//                     ]
//                 ),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Status"),
//                       TextWidget(text: "${model.status}")
//                     ]
//                 ),
//                 DividerWidget(),
//               ],
//             ),
//           )
//         ],
//       ),

//     );
//   }
// }
