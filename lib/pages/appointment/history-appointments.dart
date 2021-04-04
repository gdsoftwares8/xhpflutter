import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xhp/blocs/ChuckAppointmentbloc.dart';
import 'package:xhp/models/appointment_model.dart';
import 'package:xhp/models/appointment_responce.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/SharedPref.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/DividerWidget.dart';
import 'package:xhp/widgets/Error.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/Loading.dart';
import 'package:xhp/widgets/text_widget.dart';

class AppointmentHistory extends StatefulWidget {
  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  SharedPref sharedPref = SharedPref();
  ChuckAppointmentbloc _bloc;
  String memberId = "1";
  @override
  initState()  {
    super.initState();
  //  memberId = sharedPref.readString(GlobalVars.id);
  //   final prefs = await SharedPreferences.getInstance();
  //   memberId =  prefs.getString(GlobalVars.id);
    _bloc = ChuckAppointmentbloc(memberId);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Appointment History",
            onPressed: (){
              Navigator.pop(context);
            }),
        body: StreamBuilder<Response<AppointmentResponce>>(
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
                  AppointmentResponce res = snapshot.data.data;
                  if(res.status == 1) {
                    GlobalFunc.logPrint("total Appointments ${res.result.length}");
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        res.result.reversed;
                        return drawItem(res.result[index]);
                      },
                      itemCount: res.result.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                    );
                  } else {
                    return Error(
                      errorMessage: res.message,
                      onRetryPressed: () => _bloc.fetchAppointmets(memberId),
                    );
                  }
                  break;
                case Status.ERROR:
                  return Error(
                    errorMessage: snapshot.data.message,
                    onRetryPressed: () => _bloc.fetchAppointmets(memberId),
                  );
                  break;
              }
            }
            return Container();
          },
        ),
        /*body: RefreshIndicator(
          onRefresh: _bloc.fetchAppointmets(memberId),
          child: StreamBuilder<Response<AppointmentResponce>>(
            stream: _bloc.chuckListStream,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                switch(snapshot.data.status){
                  case Status.LOADING:
                    return Loading(loadingMessage: snapshot.data.message);
                    break;
                  case Status.COMPLETED:
                  // return CategoryList(categoryList: snapshot.data.data);
                    AppointmentResponce res = snapshot.data.data;
                    if(res.status == 1) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return drawItem(res.result[index]);
                        },
                        itemCount: res.result.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                      );
                    } else {
                      return Error(
                        errorMessage: res.message,
                        onRetryPressed: () => _bloc.fetchAppointmets(memberId),
                      );
                    }
                    break;
                  case Status.ERROR:
                    return Error(
                      errorMessage: snapshot.data.message,
                      onRetryPressed: () => _bloc.fetchAppointmets(memberId),
                    );
                    break;
                }
              }
              return Container();
            },
          ),
        ),*/
      ),
    );
  }

  Widget drawItem(AppointmentModel model) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          children: <Widget>[
            Expanded(child: TextWidget(text:"Peter Georg")),
            Text(
              "Dental",
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
                      TextWidget(text: model.company)
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
                      TextWidget(text: "Preferred Date"),
                      TextWidget(text: model.preferredDate)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Status"),
                      TextWidget(text: model.status)
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Follow Up Appointment"),
                      TextWidget(text: '-')
                    ]),
                DividerWidget(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "IFC Status"),
                      TextWidget(text: model.ifcStatus)
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
