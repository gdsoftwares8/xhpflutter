import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xhp/blocs/ChuckSignup1.dart';
import 'package:xhp/models/signupfirst_response.dart';
import 'package:xhp/networking/Response.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/GlobalWidgets.dart';
import 'package:xhp/widgets/TextForm.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

// enum Gender { Male, Female, Others }
// enum XhpAuth { Both, Either }

class PersonalDetail extends StatefulWidget {
  final Function onPressed;

  const PersonalDetail({Key key, this.onPressed}) : super(key: key);
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  bool _loading = false;
  String _selectedText;
  String gender="";
  String strDob = "";
  String _value = "";
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateCtroller;
  // Gender gender;
  // XhpAuth xhp;
  ChuckSignupFirstbloc _bloc;
  bool isMale=false;
  bool isFemale =false;
  bool isOther =false;
   bool isBoth=false;
  bool isEither =false;
  String xhp="";




  @override
  void initState() {
    dateCtroller = TextEditingController();
    _bloc = ChuckSignupFirstbloc();
    listenStream();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    dateCtroller.dispose();
      _bloc.dispose(); 
    // TODO: implement dispose
    super.dispose();
  }

    listenStream() {
    _bloc.chuckListStream.listen((Response<SignupFirstResponce> event) {
      
      GlobalFunc.logPrint("Login listen ${event.message}");
      switch(event.status) {
        case Status.LOADING:
          GlobalFunc.logPrint(event.message);
          updateLoadingState(true);
          break;
        case Status.COMPLETED:
          GlobalFunc.logPrint(" Success ${event.data}");
          updateLoadingState(false);
          if(event.data.userData!=null) {
            // savebool(true);
            // GlobalFunc.saveUserData(event.data.userData, context, sharedPref);
            Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
          } else {
            GlobalFunc.showToast("Error:- "+event.message);
          }
          break;
        case Status.ERROR:
          updateLoadingState(false);
          GlobalFunc.showToast(event.message);
          break;
      }

    }, onError: (error){
      print("Error $error");
    }, onDone: () {
      print("Stream closed!");
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _formKey = Provider.of<SignUpProvider>(context);

    return Scaffold(
        appBar: GlobalWidgets.getToolbarWithBack(
            title: "Personal Info",
            onPressed: () {
              Navigator.pop(context);
            }),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(5),
                elevation: 2,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.dstATop,
                        ),
                        image: ExactAssetImage("assets/xhp.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      // make sure we apply clip it properly
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter your personal details*",
                                  //style: Constant.heading,
                                ),
                                SizedBox(height: 10),
                                DropdownButton<String>(
                                  hint: Text("Title"),
                                  value: _selectedText,
                                  items: <String>['Mr.', 'Mrs.', 'Ms', 'Miss']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String val) {
                                    setState(() {
                                      _selectedText = val;
                                    });
                                  },
                                ),
                                TextFormWidget(
                                  labelText: "First Name",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Middle Name",

                                  // validator: signInProvider.validateEmpty,
                                  // onChanged: (value) {
                                  //   signInProvider.validateEmpty(value);
                                  // },
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Last Name",
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "DOB",
                                  controller: dateCtroller,
                                  onTap: () async {
                                    DateTime date = DateTime(1900);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100));
                                    var x =
                                        date.toIso8601String().substring(0, 10);
                                    dateCtroller.text = x;
                                    setState(() {
                                      dateCtroller.text = x;
                                    });
                                    print(dateCtroller.text);
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Phone",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                Text("Account Information*"),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Email",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "User ID",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Password",
                                  obscureText: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,

                                  //validator: signInProvider.passValidate,
                                  onChanged: (value) {
                                    // signInProvider.passValidate(value);
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Confirm Password",
                                  obscureText: true,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,

                                  //validator: signInProvider.passValidate,
                                  onChanged: (value) {
                                    // signInProvider.passValidate(value);
                                  },
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "4 digit PIN",
                                  obscureText: true,
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextFormWidget(
                                  labelText: "Referral Code",
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 10),
                                TextWidget(
                                  text: "Gender",
                                  textSize: 14,
                                ),
                                Row(
                                  
                                  children:[
                                

                                  
                                 RaisedButton(child: Text("Male",style:TextStyle(color: isMale?Colors.white:Colors.black),),
                                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                                // disabledColor: Colors.white,
                                 color:isMale?GlobalVars.buttonColor:Colors.white,                  

                                 
                                

                                //backgroundColor: isMale?GlobalVars.buttonColor:Colors.transparent,                  
                                  onPressed: (){
                                    setState(() {
                                    gender="male";
                                    isMale=true;
                                    isFemale=false;
                                    isOther=false;

                                      
                                    });
                                  },),
                                  
                                  SizedBox(width:20),
                                     RaisedButton(child: Text("Female",style:TextStyle(color: isFemale?Colors.white:Colors.black),),
                                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),       color:isFemale?GlobalVars.buttonColor:Colors.white,                  
          
                                  onPressed: (){
                                    setState(() {
                                    gender="female";
                                    isMale=false;
                                    isFemale=true;
                                    isOther=false;
                                      
                                    });
                                  },),
                                  SizedBox(width:20),
                                  RaisedButton(child: Text("Other",style:TextStyle(color: isOther?Colors.white:Colors.black),),
                                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),      color:isOther?GlobalVars.buttonColor:Colors.white,                  
             
                                  onPressed: (){
                                    setState(() {
                                    gender="Other";
                                    isMale=false;
                                    isFemale=false;
                                    isOther=true;
                                      
                                    });
                                  },)
                                ])
                                // RadioListTile(
                                //   value: Gender.Male,
                                //   groupValue: gender,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       gender = value;
                                //     });
                                //   },
                                //   title: TextWidget(text: "Male"),
                                //   selectedTileColor: Colors.orange,
                                //   //
                                // ),
                                // RadioListTile(
                                //   value: Gender.Female,
                                //   groupValue: gender,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       gender = value;
                                //     });
                                //   },
                                //   title: TextWidget(text: "Female"),
                                //   selectedTileColor: Colors.orange,
                                // ),
                                // RadioListTile(
                                //   value: Gender.Others,
                                //   groupValue: gender,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       gender = value;
                                //     });
                                //   },
                                //   title: TextWidget(text: "Others"),
                                //   // selectedTileColor: Constant.primary,
                                // ),
                                ,
                                SizedBox(height: 10,),
                                TextWidget(
                                  text: "Select XHP Authority",
                                  textSize: 14,
                                ),
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children:[
                                   RaisedButton(child: Text("Both",style:TextStyle(color: isBoth?Colors.white:Colors.black),),
                                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),      color:isBoth?GlobalVars.buttonColor:Colors.white,                    
                                  onPressed: (){
                                    setState(() {
                                    xhp="Both";
                                    isBoth=true;
                                    isEither=false;
                                      
                                    });
                                  },),
                                  SizedBox(width:20),

                                       RaisedButton(child: Text("Either",style:TextStyle(color: isEither?Colors.white:Colors.black),),
                                 shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),       
                                color: isEither?GlobalVars.buttonColor:Colors.white,                  
                                  onPressed: (){
                                    setState(() {
                                    xhp="Either";
                                    isBoth=false;
                                    isEither=true;
                                      
                                    });
                                  },)
                                ])
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 20),
              ButtonWidget(
                  text: 'Step 1/4',
                  onPressed: () {
                  // _bloc.fetchSignupFirst(username, password)   
                  widget.onPressed();

                  })
            ],
          ),
        ));
  }
    updateLoadingState(bool loading) {
    setState(() {
      this._loading = loading;
    });
  }
}
