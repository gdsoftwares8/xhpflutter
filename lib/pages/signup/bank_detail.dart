import 'package:flutter/material.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
class BankDetails extends StatefulWidget {
  final Function onPressed;

  const BankDetails({Key key, this.onPressed}) : super(key: key);
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Bank Details",
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
          // DropdownButtonFormField(
          //   hint: Text("Select your bank"),
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     contentPadding: EdgeInsets.all(10.0),
          //   ),
          //   items: [
          //     DropdownMenuItem(child: Text("Item1")),
          //   ],
          // ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "Account Number",
            autovalidateMode: AutovalidateMode.onUserInteraction,
           
          ),
          SizedBox(height: 10),
          TextFormWidget(
             labelText: "Re-enter Account Number",
            autovalidateMode: AutovalidateMode.onUserInteraction,
            
          ),
          SizedBox(height: 10),
          TextFormWidget(
            labelText: "IFSC Code",
            
          ),
        ],
      ),
    )
                  )


              ),
              SizedBox(height:20),
              ButtonWidget(
                  text: 'Step 2/4',
                  onPressed: () {
                    widget.onPressed();

                  })
            ],
          ),
      ));
    // return Form(
    // child: Column(
    //   children: [
    //     // DropdownButtonFormField(
    //     //   hint: Text("Select your bank"),
    //     //   decoration: InputDecoration(
    //     //     border: OutlineInputBorder(),
    //     //     contentPadding: EdgeInsets.all(10.0),
    //     //   ),
    //     //   items: [
    //     //     DropdownMenuItem(child: Text("Item1")),
    //     //   ],
    //     // ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "Account Number",
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
         
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //        labelText: "Re-enter Account Number",
    //       autovalidateMode: AutovalidateMode.onUserInteraction,
          
    //     ),
    //     SizedBox(height: 10),
    //     TextFormWidget(
    //       labelText: "IFSC Code",
          
    //     ),
    //   ],
    // ),
    // );
  }
}