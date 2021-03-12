import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  //Stepper
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void setStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  //Validation
  String firstNameStr;
  String lastNameStr;
  String emailStr;
  String phoneStr;
  String genderStr = "";
  final formKey = GlobalKey<FormState>();

  //Validation
  String get firstName => firstNameStr;

  String get lastName => lastNameStr;

  String get email => emailStr;

  String get phone => phoneStr;

  String get gender => genderStr;

  //Validation
  void setFirstName(String value) {
    firstNameStr = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastNameStr = value;
    notifyListeners();
  }

  void setEmail(String value) {
    emailStr = value;
    notifyListeners();
  }

  void setPhone(String value) {
    phoneStr = value;
    notifyListeners();
  }

  void setGender(String value) {
    genderStr = value;
    notifyListeners();
  }

  String validateEmpty(String value) {
    if (value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  String validateGender(String value) {
    if (gender.isEmpty) {
      return "Select gender";
    }
    return null;
  }

  String emailValidate(String value) {
    var pattern = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (value.isEmpty) {
      return "Field can't be empty";
    } else if (!pattern.hasMatch(value)) {
      return "Invalid Email.";
    } else {
      return null;
    }
  }
   String passValidate(String value) {
    var pattern = RegExp(
        r"^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*");
    if (value.isEmpty) {
      return "Field can't be empty";
    } else if (!pattern.hasMatch(value)) {
      return "Invalid Password. It includes 8 Characters, \n One Upper, \n One Lower, \n One Number \n One Special Character";
    } else {
      return null;
    }
  }
 

  String phoneValidate(String value) {
    var pattern = RegExp(r"^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$");
    if (value.isEmpty) {
      return "Field can't be empty";
    } else if (!pattern.hasMatch(value)) {
      return "Invalid Phone number";
    } else {
      return null;
    }
  }
}
