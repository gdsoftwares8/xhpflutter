import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckInterestbloc.dart';
import 'package:xhp/models/appointment_model.dart';
import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution-model.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/models/interest_model.dart';
import 'package:xhp/models/interest_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class InterestHistory extends StatefulWidget {
  @override
  _InterestHistoryState createState() => _InterestHistoryState();
}

class _InterestHistoryState extends State<InterestHistory> {
  ChuckInterestbloc _bloc;
  String memberId = "1";
  @override
  void initState() {
    super.initState();
    _bloc = ChuckInterestbloc(memberId);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Interest History",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: StreamBuilder<Response<InterestResponse>>(
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
                  InterestResponse res = snapshot.data.data;
                  if(res.status == 1) {
                    GlobalFunc.logPrint("total Interests ${res.result.interest.thisYear.length}");
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return drawItem(res.result.interest.thisYear[index],res.result.years,res.result.interest);
                      },
                      itemCount: res.result.interest.thisYear.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchInterests(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchInterests(memberId),
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

  Widget drawItem(InterestModel model,Years years,Interest interest) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: TextWidget(text: years.aYearRange[0])),
            TextWidget(
            text:  model.membershipNo,
              // style: Theme.of(context).textTheme.caption,
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
                      TextWidget(text: 'Total'),
                      TextWidget(text:model.s01Total)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: 'Member'),
                      TextWidget(text:model.firstName+" "+model.lastName)
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
                      TextWidget(text: "Status"),
                      TextWidget(text: model.n01Withhold)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Actual Interest"),
                      TextWidget(text: model.s01ActualInterest)
                    ]),
                DividerWidget(),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Expected Interest"),
                      TextWidget(text: model.s01ExpectedInterest)
                    ]),
                DividerWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Amount"),
                      TextWidget(text: model.s01Total)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Citizen"),
                      TextWidget(text: model.citizenTfn)
                    ]),
                     DividerWidget(),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Start Year"),
                      TextWidget(text: interest.startYear)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "End Year"),
                      TextWidget(text: interest.endYear)
                    ]),
                DividerWidget(),
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
