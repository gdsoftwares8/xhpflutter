import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckContributionbloc.dart';
import 'package:xhp/models/appointment_model.dart';
import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/models/contribution-model.dart';
import 'package:xhp/models/contribution_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class ContributionHistory extends StatefulWidget {
  @override
  _ContributionHistoryState createState() => _ContributionHistoryState();
}

class _ContributionHistoryState extends State<ContributionHistory> {
  ChuckContributionbloc _bloc;
  String memberId = "1";
  @override
  void initState() {
    super.initState();
    _bloc = ChuckContributionbloc(memberId);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Contribution History",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: StreamBuilder<Response<ContributionResponse>>(
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
                  ContributionResponse res = snapshot.data.data;
                  if(res.status == 1) {
                    GlobalFunc.logPrint("total Contributions ${res.result.aMemberGroup.length}");
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return drawItem(res.result.aMemberGroup[index],res.result.aYearRange[index],res.result.aServiceCategory[index]);
                      },
                      itemCount: res.result.aMemberGroup.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchContributions(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchContributions(memberId),
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

  Widget drawItem(ContributionMember model,ContributionYear year,ContributionService service) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: TextWidget(text: model.membershipNo)),
            Text(
              model.firstName+" "+model.lastName,
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
                      TextWidget(text: 'Start Year'),
                      TextWidget(text: year.startYear)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: 'End Year'),
                      TextWidget(text: year.endYear),
                    ]),

                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Country"),
                      TextWidget(text: model.liveCountry)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Activation Date"),
                      TextWidget(text: model.activationDate)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Status"),
                      TextWidget(text: year.status)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Service Category"),
                      TextWidget(text: service.name )
                    ]),
                DividerWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Amount"),
                      TextWidget(text: model.actualAmount)
                    ]),
                DividerWidget(),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Available Balance"),
                      TextWidget(text: model.availableBalance)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "XHP Authority "),
                      TextWidget(text: model.xhpAuthority)
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



class Contribution extends StatefulWidget {
  @override
  _ContributionState createState() => _ContributionState();
}

class _ContributionState extends State<Contribution> {
  String _selectedText;
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Contribution Reports",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(5),
                elevation: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextWidget(
                          text: "Financial Year",
                          //style: Constant.heading,
                        ),
                      ),
                      SizedBox(height: 0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey,width:1),borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: TextWidget(text: "Select Year "),
                              value: _selectedText,
                              items: <String>['2018-2019', '2019-2020', '2020-2021']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value),
                                );
                              }).toList(),
                              onChanged: (String val) {
                                setState(() {
                                  _selectedText = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                     
                      SizedBox(height:20),
                    ]),
              ), SizedBox(height:20),
              ButtonWidget(
                          text: 'Contribution History',
                          onPressed: () {
                            return showDialog(
                                  context: context,
                                  builder: (context) => new AlertDialog(
                                    content: TextWidget(text:'Do you want to check ?',textSize: 18,),
                                    actionsPadding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    actions: <Widget>[
                                      GestureDetector(
                                        onTap: () => Navigator.of(context).pop(false),
                                        child: TextWidget(text:
                                          "Cancel",
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
                                        onTap: () => Navigator.of(context)
                                            .pushReplacementNamed('/contributions-history'),
                                        child: TextWidget(text:
                                          "Yes",
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
                         
            ],
          ),
        ),
      ),
    );
  }

}


