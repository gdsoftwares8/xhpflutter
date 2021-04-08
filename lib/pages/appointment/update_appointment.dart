import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xhp/blocs/ChuckUpdateAppointmentbloc.dart';
import 'package:xhp/models/update_app_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/NewTextWidget.dart';
import 'package:xhp/widgets/TopbarWidget.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class UpdateAppointment extends StatefulWidget {
  @override
  _UpdateAppointmentState createState() => _UpdateAppointmentState();
}

class _UpdateAppointmentState extends State<UpdateAppointment> {
  String _selectedText;
  String memberId;
  String remarks;
  ChuckUpdateAppointmentbloc _bloc;
  bool _loading=false;
  String appointmentId;


  listenStream() {
    _bloc.chuckListStream.listen((Response<UpdateAppointmentResponse> event) {
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
    _bloc = ChuckUpdateAppointmentbloc();
    listenStream();
  }

  @override
  void dispose() {
    _bloc.dispose(); //Streams must be closed when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            TopWidget(text: "Update Appointment"),
            SizedBox(
              height: 40,
            ),
            Column(children:[
              BoxTextFormWidgett(width:size.width*.60,
                hintText:"Member Id",
                  onChanged: (value) {
                                memberId = value;
                              },
              ),
              SizedBox(height:10),
                 BoxTextFormWidgett(
                hintText:"Appointment Id",width:size.width*.60,
                onChanged: (value){
                  appointmentId=value;
                },
              ),SizedBox(height:10),

                         Column(
                                     children: [
                                       //TextWidget(
                          //   text: "Select Status",
                          //   fontWeight: FontWeight.bold,
                          // ),
                          // SizedBox(height:3),
                        
                                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                             width: MediaQuery.of(context).size.width*.60,
                        height: MediaQuery.of(context).size.width*.12,
                          
                          decoration: BoxDecoration(color:Colors.grey[300],borderRadius: BorderRadius.circular(25),border:Border.all(color:Colors.black) ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              
                            hint: TextWidget(text: "Select Status",fontWeight: FontWeight.bold,),
                              value: _selectedText,
                              items: <String>['Confirm', 'Pending', 'Cancel','Reschedule']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: TextWidget(text: value,color: Colors.black,fontWeight: FontWeight.bold,),
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
                                     ],
                                   ),SizedBox(height:10),
                                    BoxTextFormWidgett(
                hintText:"Remarks",width:size.width*.60,
                onChanged: (String value){
                  remarks=value;

                },
              ),
SizedBox(height:50),
ButtonWidget(text: "Update", onPressed: (){
    _bloc.fetchUpdateAppointment(appointmentId, memberId, _selectedText, remarks);

                                        Fluttertoast.showToast(
                                          msg: "Updated Successfully !",
                                        );
                                        Navigator.of(context)
                                            .pushReplacementNamed('/appointment-status');

})

            ])

          ]),
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
