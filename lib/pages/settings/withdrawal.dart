import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckWithdrawalbloc.dart';
import 'package:xhp/models/withdrawal-model.dart';
import 'package:xhp/models/withdrawal_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/text_widget.dart';
import 'package:xhp/utils/global_vars.dart';

class PendingWithdrawal extends StatefulWidget {
  @override
  _PendingWithdrawalState createState() => _PendingWithdrawalState();
}

class _PendingWithdrawalState extends State<PendingWithdrawal> {
  ChuckWithdrawalbloc _bloc;
  String memberId = "1";
  @override
  void initState() {
    super.initState();
    _bloc = ChuckWithdrawalbloc(memberId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Withdrawal",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: StreamBuilder<Response<WithdrawalResponce>>(
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
                  WithdrawalResponce res = snapshot.data.data;
                  if(res.status == 1) {
                    GlobalFunc.logPrint("total Withdrawals ${res.result.withdraw}");
                    return (res.result.withdraw.length==0)?Center(child: TextWidget(text:"No Withdrawals yet !",textSize: 20,)):ListView.builder(
                      itemBuilder: (context, index) {
                        return drawItem(res.result.withdraw[index],index);
                      },
                      itemCount: res.result.withdraw.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchWithdrawals(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchWithdrawals(memberId),
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

  Widget drawItem(Withdrawal model, int position) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: TextWidget(text: 'Sr.No.${position+1}')),
            Text(
              model.WithdrawalNumber,
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
                      TextWidget(text: "${model.idWithdrawal}")
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
                      TextWidget(text: "Withdrawal Amount"),
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
