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
                        return drawItem(res.result.interest.thisYear[index]);
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

  Widget drawItem(InterestModel model) {
    return Card(
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
                      TextWidget(text: model.firstName)
                    ]),
                DividerWidget(),
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
                      TextWidget(text: "Status"),
                      TextWidget(text: model.n01Withhold)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Follow Up Interest"),
                      TextWidget(text: '-')
                    ]),
                DividerWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Amount"),
                      TextWidget(text: model.s01ActualInterest)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "IFC Status"),
                      TextWidget(text: model.title)
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
