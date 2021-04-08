// import 'package:flutter/material.dart';

// import 'package:xhp/blocs/ChuckSecondaryMembloc.dart';
// import 'package:xhp/models/invoice.dart';
// import 'package:xhp/models/invoice_responce.dart';
// import 'package:xhp/models/secondary_member.dart';
// import 'package:xhp/models/secondary_member_response.dart';
// import 'package:xhp/networking/Response.dart';
// import 'package:xhp/utils/GlobalFuncs.dart';
// import 'package:xhp/widgets/DividerWidget.dart';
// import 'package:xhp/widgets/Error.dart';
// import 'package:xhp/widgets/GlobalWidgets.dart';
// import 'package:xhp/widgets/Loading.dart';
// import 'package:xhp/widgets/TopbarWidget.dart';
// import 'package:xhp/widgets/text_widget.dart';
// import 'package:xhp/utils/global_vars.dart';

// class SecondaryMember extends StatefulWidget {
//   @override
//   _SecondaryMemberState createState() => _SecondaryMemberState();
// }

// class _SecondaryMemberState extends State<SecondaryMember> {
//   ChuckSecondaryMemberbloc _bloc;
//   String memberId = "1";
//   @override
//   void initState() {
//     super.initState();
//     _bloc = ChuckSecondaryMemberbloc(memberId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
       
//         body: StreamBuilder<Response<SecondaryMemberResponse>>(
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
//                   SecondaryMemberResponse res = snapshot.data.data;
//                   if(res.status == 1) {
//                     GlobalFunc.logPrint("total SecondaryMembers ${res.result.length}");
//                     return SingleChildScrollView(
//                                           child: Column(
//                         children: [TopWidget(text:"Secondary Members"),
//                         SizedBox(height:30),
//                           ListView.builder(
//                             itemBuilder: (context, index) {
//                               return drawItem(res.result[0]);
//                             },
//                             itemCount: res.result.length,
//                             shrinkWrap: true,
//                             physics: ClampingScrollPhysics(),
//                           ),
//                         ],
//                       ),
//                     );
//                   } else {
//                     return Error(
//                       errorMessage: res.message,
//                       onRetryPressed: () => _bloc.fetchSecondaryMembers(memberId),
//                     );
//                   }
//                   break;
//                 case Status.ERROR:
//                   return Error(
//                     errorMessage: snapshot.data.message,
//                     onRetryPressed: () => _bloc.fetchSecondaryMembers(memberId),
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

//   Widget drawItem(SecondaryMemberModel model) {
//     return Card(
//       child: ExpansionTile(
//         initiallyExpanded: true,
//         title: Row(
//           children: <Widget>[
//             Expanded(child: TextWidget(text:model.firstName+" "+model.middleName+" "+model.lastName)),
//             Text(
//              model.idMember.toString(),
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
//                       TextWidget(text: 'Membership No'),
//                       TextWidget(text: model.membershipNo)
//                     ]),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: 'Mobile No'),
//                       TextWidget(text: model.mobileNo)
//                     ]),
//                 DividerWidget(

//                 ),


//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "Email"),
//                       TextWidget(text: model.email)
//                     ]),
//                       DividerWidget(

//                 ),


//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "DOB"),
//                       TextWidget(text: model.dob)
//                     ]),
                    


//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "Address"),
//                       TextWidget(text: model.address1)
//                     ]),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "Xhp Authority"),
//                       TextWidget(text: model.xhpAuthority)
//                     ]),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "Agreement Date"),
//                       TextWidget(text: model.agreementDate)
//                     ]),
//                 DividerWidget(),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextWidget(text: "Status"),
//                       TextWidget(text: model.status)
//                     ]),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckInvoicestbloc.dart';
import 'package:xhp/models/invoice.dart';
import 'package:xhp/models/invoice_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

class SecondaryMember extends StatefulWidget {
  @override
  _SecondaryMemberState createState() => _SecondaryMemberState();
}

class _SecondaryMemberState extends State<SecondaryMember> {
  ChuckInvoicebloc _bloc;
  String memberId = "1";
  @override
  void initState() {
    super.initState();
    _bloc = ChuckInvoicebloc(memberId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(      
        body: StreamBuilder<Response<InvoiceResponce>>(
          stream: _bloc.chuckListStream,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              GlobalFunc.logPrint("snapshot $snapshot");
              switch(snapshot.data.status){
                case Status.LOADING:
                  return Loading(loadingMessage: snapshot.data.message);
                  break;
                case Status.COMPLETED:
                // return CategoryList(categoryList: snapshot.data.data);
                  InvoiceResponce res = snapshot.data.data;
                  if(res.status == 1) {
                    GlobalFunc.logPrint("total Invoices ${res.result.length}");
                    return SingleChildScrollView(
                                          child: Column(
                        children: [
                          TopWidget(text:"Invoices"),
                          SizedBox(height:30),
                          ListView.builder(
                            itemBuilder: (context, index) {
                              return drawItem(res.result[index],index);
                            },
                            itemCount: res.result.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchInvoices(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchInvoices(memberId),
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

  Widget drawItem(Invoice model, int position) 
   {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: TextWidget(text: 'Sr.No.${position+1}')),
            Text(
              model.invoiceNumber,
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
                      TextWidget(text: "${model.idInvoice}")
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
                      TextWidget(text: "\$${model.grandTotal}")
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
                      TextWidget(text: model.status)
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
