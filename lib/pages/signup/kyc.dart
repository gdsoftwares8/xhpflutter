import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';

class KYC extends StatefulWidget {
  final Function onPressed;

  const KYC({Key key, this.onPressed}) : super(key: key);
  @override
  _KYCState createState() => _KYCState();
}

class _KYCState extends State<KYC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "KYC Proof",
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
                  child:Container(
                    padding: EdgeInsets.all(10),
                    child:  Form(
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Citizenship",
            autovalidateMode: AutovalidateMode.onUserInteraction,
           
          ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Aborginal / Torres Strait Island",
            
          ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Income",
            autovalidateMode: AutovalidateMode.onUserInteraction,
           
          ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Countries of Tax Residence last 3 years",
            
          ),
          SizedBox(height: 10),
          TextFormWidget(
               labelText: "ID Document",
            
          ),
        ],
      ),
    )
                  )


              ),
              SizedBox(height:20),
              ButtonWidget(
                  text: 'Finish',
                  onPressed: () {
                    // widget.onPressed();
                    Fluttertoast.showToast(msg: "Successfully Signup! Please Login");
                    Navigator.of(context).pushReplacementNamed("/login");

                  })
            ],
          ),
      ));
    // return Form(
    // child: Column(
    //   children: [
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "Citizenship",
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
         
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "Aborginal / Torres Strait Island",
          
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "Income",
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
         
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "Countries of Tax Residence last 3 years",
          
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //          labelText: "ID Document",
          
    //     ),
    //   ],
    // ),
    // );
  }
}