import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';


class UploadProof extends StatefulWidget {
  final Function onPressed;

  const UploadProof({Key key, this.onPressed}) : super(key: key);
  @override
  _UploadProofState createState() => _UploadProofState();
}

class _UploadProofState extends State<UploadProof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Upload Proof",
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
                    child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter detail",
            //style: Constant.heading
          ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Enter Aadhar card number ",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 10),
          TextFormWidget(
             labelText: "Enter Pan card number ",
          ),
          SizedBox(height: 10),
        ],
      ),
    )
                  )


              ),
              SizedBox(height:20),
              ButtonWidget(
                  text: 'Step 3/4',
                  onPressed: () {
                    widget.onPressed();
                    

                  })
            ],
          ),
      ));
  }
}