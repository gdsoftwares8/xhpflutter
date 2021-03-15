import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xhp/provider/sign_up_provider.dart';
import 'package:xhp/widgets/button_widget.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _value = '';
  String strDob = "";
  String value='';
  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignUpProvider>(context);
    int current = signInProvider.currentStep;

    void submitPersonal() {
      if (signInProvider.formKey.currentState.validate()) {
        //Add data to firebase
        // on Success Increment _currentStep to navigate.
        signInProvider.formKey.currentState.save();
        signInProvider.setStep(++current);
      } else {
        print("Failed");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: current,
          controlsBuilder: (context, {onStepCancel, onStepContinue}) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: null,
            );
          },
          steps: steps(),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          switch (current) {
            case 0:
              submitPersonal();
              break;
            case 1:
              signInProvider.setStep(++current);
              break;
            case 2:
              signInProvider.setStep(++current);
              break;
            case 3:
              break;
          }
        },

        child: 
              current == 3 ? Container(margin: EdgeInsets.all(5),
                child: ButtonWidget(text:"Finish",onPressed: (){
                  Navigator.pushReplacementNamed(context, '/login');
                },),
              ) : 
              Container(
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.blue[100],
          ),
          padding: EdgeInsets.all(10),
          child: Center(
            child: 
              Text("Continue",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.white),
            ),
            
          ),
        ),
      ),
    );
  }

  List<Step> steps() {
    final signInProvider = Provider.of<SignUpProvider>(context);
    int _currentStep = signInProvider.currentStep;
    List<Step> steps = [
      Step(
        isActive: _currentStep >= 0,
        title: Text("Personal Detail"),
        state: _currentStep == 0
            ? StepState.editing
            : (_currentStep > 0 ? StepState.complete : StepState.indexed),
        content: PersonalDetail(),
      ),
      Step(
        state: _currentStep == 1
            ? StepState.editing
            : (_currentStep > 1 ? StepState.complete : StepState.indexed),
        isActive: _currentStep >= 1,
        title: Text("Bank Detail"),
        content: BankDetail(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep == 2
            ? StepState.editing
            : (_currentStep > 2 ? StepState.complete : StepState.indexed),
        title: Text("Proof Upload"),
        content: UploadProof(),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep == 3
            ? StepState.editing
            : (_currentStep > 3 ? StepState.complete : StepState.indexed),
        title: Text("KYC / CIF"),
        content: KYC(),
      ),
    ];
    return steps;
  }

  Widget UploadProof() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter detail",
            //style: Constant.heading
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Enter Aadhar card number ",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Enter Pan card number ",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
         
        ],
      ),
    );
  }

  Widget BankDetail() {
    return Form(
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
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Account Number",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Re-enter Account Number",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "IFSC Code",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          
        ],
      ),
    );
  }

  Widget KYC() {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Citizenship",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Aborginal / Torres Strait Island",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Income",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "Countries of Tax Residence last 3 years",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: "ID Document",
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget PersonalDetail() {
    final signInProvider = Provider.of<SignUpProvider>(context);
    // var _value="";

    return Form(
      key: signInProvider.formKey,
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
  items: <String>['Mr.', 'Mrs.','Ms', 'Miss'].map((String value) {
    return  DropdownMenuItem<String>(
      value: value,
      child:  Text(value),
    );
  }).toList(),
  onChanged: (String val) {
    setState(() {
      value=val;
    });

  },
),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "First Name",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: signInProvider.validateEmpty,
              onChanged: (value) {
                signInProvider.validateEmpty(value);
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Middle Name",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              // validator: signInProvider.validateEmpty,
              // onChanged: (value) {
              //   signInProvider.validateEmpty(value);
              // },
            ),
            SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Last Name",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: signInProvider.validateEmpty,
              onChanged: (value) {
                signInProvider.validateEmpty(value);
              },
            ),
            SizedBox(height: 10),
            new TextFormField(
              decoration: new InputDecoration(hintText: 'DOB'),
              maxLength: 10,

              //validator: validateDob,
              onSaved: (String val) {
                strDob = val;
              },
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Phone",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: signInProvider.phoneValidate,
              onChanged: (value) {
                signInProvider.phoneValidate(value);
              },
            ),
            SizedBox(height: 10),
            Text("Account Information*"),
            SizedBox(height:10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Email",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: signInProvider.emailValidate,
              onChanged: (value) {
                signInProvider.emailValidate(value);
              },
            ),
            SizedBox(height: 10),
            
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "User ID",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Password",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              //validator: signInProvider.passValidate,
              onChanged: (value) {
                // signInProvider.passValidate(value);
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              //validator: signInProvider.passValidate,
              onChanged: (value) {
                // signInProvider.passValidate(value);
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: "4 digit PIN",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: signInProvider.validateGender,
              readOnly: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Select your gender",
                //hintStyle: Constant.heading,
              ),
            ),
            RadioListTile(
              value: "Male",
              groupValue: signInProvider.gender,
              onChanged: (value) {
                signInProvider.setGender(value);
                signInProvider.formKey.currentState.validate();
              },
              title: Text("Male"),
              //selectedTileColor: Constant.primary,
            ),
            RadioListTile(
              value: "Female",
              groupValue: signInProvider.gender,
              onChanged: (value) {
                signInProvider.setGender(value);
                signInProvider.formKey.currentState.validate();
              },
              title: Text("Female"),
              // selectedTileColor: Constant.primary,
            ),
            RadioListTile(
              value: "Others",
              groupValue: signInProvider.gender,
              onChanged: (value) {
                signInProvider.setGender(value);
                signInProvider.formKey.currentState.validate();
              },
              title: Text("Others"),
              // selectedTileColor: Constant.primary,
            ),
          ],
        ),
      ),
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime(1990),
        firstDate: new DateTime(1950),
        lastDate: new DateTime(2021));
    if (picked != null) setState(() => _value = picked.toString());
    print(_value);
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:xhp/provider/sign_up_provider.dart';
// import 'package:xhp/widgets/TextForm.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   var _value = '';
//   String strDob = "";
//   String value='';
//   @override
//   Widget build(BuildContext context) {
//     final signInProvider = Provider.of<SignUpProvider>(context);
//     int current = signInProvider.currentStep;

//     void submitPersonal() {
//       if (signInProvider.formKey.currentState.validate()) {
//         //Add data to firebase
//         // on Success Increment _currentStep to navigate.
//         signInProvider.formKey.currentState.save();
//         signInProvider.setStep(++current);
//       } else {
//         print("Failed");
//       }
//     }

//     return Scaffold(
//       body: SafeArea(
//         child: Stepper(
//           type: StepperType.vertical,
//           currentStep: current,
//           controlsBuilder: (context, {onStepCancel, onStepContinue}) {
//             return Padding(
//               padding: EdgeInsets.all(16.0),
//               child: null,
//             );
//           },
//           steps: steps(),
//         ),
//       ),
//       bottomNavigationBar: InkWell(
//         onTap: () {
//           switch (current) {
//             case 0:
//               submitPersonal();
//               break;
//             case 1:
//               signInProvider.setStep(++current);
//               break;
//             case 2:
//               signInProvider.setStep(++current);
//               break;
//             case 3:
//               break;
//           }
//         },
//         child: Container(
//           height: 50,
//           margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(7),
//             color: Colors.blue[100],
//           ),
//           padding: EdgeInsets.all(10),
//           child: Center(
//             child: Text(
//               current == 3 ? "Finish" : "Continue",
//               style: Theme.of(context)
//                   .textTheme
//                   .headline
//                   .copyWith(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<Step> steps() {
//     final signInProvider = Provider.of<SignUpProvider>(context);
//     int _currentStep = signInProvider.currentStep;
//     List<Step> steps = [
//       Step(
//         isActive: _currentStep >= 0,
//         title: Text("Personal Detail"),
//         state: _currentStep == 0
//             ? StepState.editing
//             : (_currentStep > 0 ? StepState.complete : StepState.indexed),
//         content: PersonalDetail(),
//       ),
//       Step(
//         state: _currentStep == 1
//             ? StepState.editing
//             : (_currentStep > 1 ? StepState.complete : StepState.indexed),
//         isActive: _currentStep >= 1,
//         title: Text("Bank Detail"),
//         content: BankDetail(),
//       ),
//       Step(
//         isActive: _currentStep >= 2,
//         state: _currentStep == 2
//             ? StepState.editing
//             : (_currentStep > 2 ? StepState.complete : StepState.indexed),
//         title: Text("Proof Upload"),
//         content: UploadProof(),
//       ),
//       Step(
//         isActive: _currentStep >= 3,
//         state: _currentStep == 3
//             ? StepState.editing
//             : (_currentStep > 3 ? StepState.complete : StepState.indexed),
//         title: Text("KYC / CIF"),
//         content: KYC(),
//       ),
//     ];
//     return steps;
//   }

//   Widget UploadProof() {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Enter detail",
//             //style: Constant.heading
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Enter Aadhar card number ",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Enter Pan card number ",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
         
//         ],
//       ),
//     );
//   }

//   Widget BankDetail() {
//     return Form(
//       child: Column(
//         children: [
//           DropdownButtonFormField(
//             hint: Text("Select your bank"),
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               contentPadding: EdgeInsets.all(10.0),
//             ),
//             items: [
//               DropdownMenuItem(child: Text("Item1")),
//             ],
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Re-enter Account Number",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "IFSC Code",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Account Number",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget KYC() {
//     return Form(
//       child: Column(
//         children: [
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Citizenship",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Aborginal / Torres Strait Island",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Income",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "Countries of Tax Residence last 3 years",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//           SizedBox(height: 10),
//           TextFormField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(10),
//               labelText: "ID Document",
//               border: OutlineInputBorder(),
//               alignLabelWithHint: true,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget PersonalDetail() {
//     final signInProvider = Provider.of<SignUpProvider>(context);
//     // var _value="";

//     return Form(
//       key: signInProvider.formKey,
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Enter your personal details*",
//               //style: Constant.heading,
//             ),
//             SizedBox(height: 10),

// DropdownButton<String>(
//   value: value,
//   items: <String>['Mr.', 'Mrs.','Ms', 'Miss'].map((String value) {
//     return  DropdownMenuItem<String>(
//       value: value,
//       child:  Text(value),
//     );
//   }).toList(),
//   onChanged: (String val) {
//     setState(() {
//       value=val;
//     });

//   },
// ),
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "First Name",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               validator: signInProvider.validateEmpty,
//               onChanged: (value) {
//                 signInProvider.validateEmpty(value);
//               },
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Middle Name",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               // validator: signInProvider.validateEmpty,
//               // onChanged: (value) {
//               //   signInProvider.validateEmpty(value);
//               // },
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Last Name",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               validator: signInProvider.validateEmpty,
//               onChanged: (value) {
//                 signInProvider.validateEmpty(value);
//               },
//             ),
//             SizedBox(height: 10),
//             new TextFormWidget(
//               decoration: new InputDecoration(hintText: 'DOB'),
            

//               //validator: validateDob,
//               onSaved: (String val) {
//                 strDob = val;
//               },
//             ),
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Phone",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               validator: signInProvider.phoneValidate,
//               onChanged: (value) {
//                 signInProvider.phoneValidate(value);
//               },
//             ),
//             SizedBox(height: 10),
//             Text("Account Information*"),
//             SizedBox(height:10),
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Email",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               validator: signInProvider.emailValidate,
//               onChanged: (value) {
//                 signInProvider.emailValidate(value);
//               },
//             ),
//             SizedBox(height: 10),
            
//             TextFormWidget(
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "User ID",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               onChanged: (value) {},
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               obscureText: true,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Password",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               //validator: signInProvider.passValidate,
//               onChanged: (value) {
//                 // signInProvider.passValidate(value);
//               },
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               obscureText: true,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "Confirm Password",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               //validator: signInProvider.passValidate,
//               onChanged: (value) {
//                 // signInProvider.passValidate(value);
//               },
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               //obscureText: true,
//               keyboardType: TextInputType.number,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.all(10),
//                 labelText: "4 digit PIN",
//                 border: OutlineInputBorder(),
//                 alignLabelWithHint: true,
//               ),
//               onChanged: (value) {},
//             ),
//             SizedBox(height: 10),
//             TextFormWidget(
//               validator: signInProvider.validateGender,
//               //readOnly: true,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: "Select your gender",
//                 //hintStyle: Constant.heading,
//               ),
//             ),
//             RadioListTile(
//               value: "Male",
//               groupValue: signInProvider.gender,
//               onChanged: (value) {
//                 signInProvider.setGender(value);
//                 signInProvider.formKey.currentState.validate();
//               },
//               title: Text("Male"),
//               //selectedTileColor: Constant.primary,
//             ),
//             RadioListTile(
//               value: "Female",
//               groupValue: signInProvider.gender,
//               onChanged: (value) {
//                 signInProvider.setGender(value);
//                 signInProvider.formKey.currentState.validate();
//               },
//               title: Text("Female"),
//               // selectedTileColor: Constant.primary,
//             ),
//             RadioListTile(
//               value: "Others",
//               groupValue: signInProvider.gender,
//               onChanged: (value) {
//                 signInProvider.setGender(value);
//                 signInProvider.formKey.currentState.validate();
//               },
//               title: Text("Others"),
//               // selectedTileColor: Constant.primary,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future _selectDate() async {
//     DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: new DateTime(1990),
//         firstDate: new DateTime(1950),
//         lastDate: new DateTime(2021));
//     if (picked != null) setState(() => _value = picked.toString());
//     print(_value);
//   }
// }
