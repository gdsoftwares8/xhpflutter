// import 'package:flutter/material.dart';


// class Signup extends StatefulWidget {
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   int index=0;
//   @override
//   Widget build(BuildContext context) {
  
//    switch (index) {
//       case 0 :
//       return Container(child: Text("1"),);
//        break;
//       case 1 :
//       return Container(child: Text("2"),);
//        break;
//       case 2 :
//       return Container(child: Text("3"),);
//        break;
//       case 3 :
//       return Container(child: Text("4"),);
//       break;
//       default:
//     }
//   }
// }

























import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xhp/provider/sign_up_provider.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/TextForm.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _value = '';
  String strDob = "";
  String value = '';
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
        child: current == 3
            ? Container(
                margin: EdgeInsets.all(5),
                child: ButtonWidget(
                  text: "Finish",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              )
            : Container(
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.blue[100],
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Continue",
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
          TextFormWidget(
            labelText: "Enter Aadhar card number ",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: 10),
          TextFormWidget(
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
    );
  }

  Widget KYC() {
    return Form(
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
    );
  }
}

class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  String _selectedText;
  String strDob = "";
  String _value = "";

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignUpProvider>(context);
    TextEditingController dateCtroller = TextEditingController();

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
              value: _selectedText,
              items: <String>['Mr.', 'Mrs.', 'Ms', 'Miss'].map((String value) {
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              
              validator: signInProvider.validateEmpty,
              onChanged: (value) {
                signInProvider.validateEmpty(value);
              },
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
              
              validator: signInProvider.validateEmpty,
              onChanged: (value) {
                signInProvider.validateEmpty(value);
              },
            ),
            SizedBox(height: 10),
            TextFormWidget(
              labelText: "DOB",
            
              controller: dateCtroller,
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                var x = date.toIso8601String().substring(0, 10);
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
             
              validator: signInProvider.phoneValidate,
              onChanged: (value) {
                signInProvider.phoneValidate(value);
              },
            ),
            SizedBox(height: 10),
            Text("Account Information*"),
            SizedBox(height: 10),
            TextFormWidget(
              labelText: "Email",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              
              validator: signInProvider.emailValidate,
              onChanged: (value) {
                signInProvider.emailValidate(value);
              },
            ),
            SizedBox(height: 10),
            TextFormWidget(
              labelText: "User ID",
              autovalidateMode: AutovalidateMode.onUserInteraction,
             
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormWidget(
              labelText: "Password",
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
             
              //validator: signInProvider.passValidate,
              onChanged: (value) {
                // signInProvider.passValidate(value);
              },
            ),
            SizedBox(height: 10),
            TextFormWidget(
               labelText: "Confirm Password",
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
             
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormWidget(
              labelText: "Referral Code",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              
              onChanged: (value) {},
            ),
            SizedBox(height: 10),
            TextFormWidget(
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
}
