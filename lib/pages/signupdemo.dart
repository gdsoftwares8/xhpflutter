import 'package:flutter/material.dart';
import 'package:xhp/pages/signup/bank_detail.dart';
import 'package:xhp/pages/signup/kyc.dart';
import 'package:xhp/pages/signup/personl_info.dart';
import 'package:xhp/pages/signup/upload_proof.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int index;

  Widget switchScreen() {
    switch (index) {
      case 0:
        return PersonalDetail(
          onPressed: () {
            setState(() {
              index = 1;
            });
          },
        );
        break;
      case 1:
        return BankDetails(
           onPressed: () {
            setState(() {
              index = 2;
            });
          },
        );
        break;
      case 2:
        return UploadProof(
           onPressed: () {
            setState(() {
              index = 3;
            });
          },
        );
        break;
      case 3:
        return KYC(
           onPressed: () {
            
          },
        );
        break;
      default:
        return PersonalDetail();
        break;
    }
  }

  @override
  void initState() {
    index = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child:  switchScreen(),

          // ButtonWidget(text: "Step"+"("+"${index+1}"+"/"+"4"+")", onPressed: (){
          //   if (index<3)
          //   setState(() {
          //     index+=1;
          //   });
          // })
     
    );
  }
}
