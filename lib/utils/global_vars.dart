import 'dart:ui';

import 'package:flutter/material.dart';

import 'GlobalFuncs.dart';

class GlobalVars {
  static String URL = "http://rupeestreet.com/xhpbackend/";
  static String BASE_URL = URL+"api/";
  static String REGISTER_URL = BASE_URL+"auth/register";
  static String LOGIN_URL = "auth/login";
  static String GET_PROFILE_URL = BASE_URL+"account";
  static String UPDATE_PROFILE_URL = "account/update_account";
  static String APPOINTMENTS_URL = "appointments";
  static String BOOK_APPOINTMENT_URL = "appointments/bookAppointment";

  static String EMAIL_VERIFIED_URL = BASE_URL+"auth/checkEmailVerified";
  static String PASSWORD_RECOVERY_URL = BASE_URL+"auth/checkEmailVerified";

  static String INVOICES_URL = "invoice";
  static String GIFTS_URL = "gift";
  static String ADD_GIFT_URL = "gift/add";
  static String TERMS_URL = "getTermsAndCondition";
  static String CONTRIBUTION_URL="report/getContribution";
  static String INTEREST_URL="report/getInterestStatement";
  static String SIGNUP_FIRST_URL="report/getInterestStatement";
  static String WITHDRAWAL_URL="report/getWithdrawal";

  // Constants For Prefrences
  static String isLogin = "isLogin";
  static String user = "user";
  static String isVerified = "isVerified";
  static String isPaymentDone = "isPaymentDone";
  static String id = "_id";
  static String fName = "fName";
  static String mName = "mName";
  static String lName = "lName";
  static String email = "email";
  static String mobileNo = "phone";
  static String title = "title";
  static String member_type = "member_type";
  static String membership_no = "membership_no";

  static String ENTER_NAME = "Enter valid name";
  static String ENTER_VALID_EMAIL = "Enter valid email";
  static String ENTER_PASSWORD = "Enter valid password";
  static String ENTER_CONFIRM_PASSWORD = "Enter valid confirm password";
  static String PASSWORD_NOT_MATCHED = "Password and Confirm password not matched";

  static List<Color> colorLib = [
    GlobalFunc.colorFromHex('#AB5952'),
    GlobalFunc.colorFromHex('#AB8952'),
    GlobalFunc.colorFromHex('#ABAB52'),
    GlobalFunc.colorFromHex('#85AB52'),
    GlobalFunc.colorFromHex('#52AB96'),
    GlobalFunc.colorFromHex('#5274AB'),
    GlobalFunc.colorFromHex('#6352AB'),
    GlobalFunc.colorFromHex('#9652AB'),
  ];

  static Color borderColor = GlobalFunc.colorFromHex('#0066FF');
  static Color widgetColor = GlobalFunc.colorFromHex('#0066FF');
  static final Color opacityColor = Color.fromRGBO(123, 82, 171, 0.94);
  static final MaterialColor primaryColor = MaterialColor(0xFF0066FF,
      const <int, Color> {
        50: const Color(0xFF0066FF),
        100: const Color(0xFF0066FF),
        200: const Color(0xFF0066FF),
        300: const Color(0xFF0066FF),
        400: const Color(0xFF0066FF),
        500: const Color(0xFF0066FF),
        600: const Color(0xFF0066FF),
        700: const Color(0xFF0066FF),
        800: const Color(0xFF0066FF),
        900: const Color(0xFF0066FF),
      });
  static final Color accentColor = Colors.orange[900];
  static final Color primaryColorDark = Colors.blue[900];
  static final Color buttonColor = Color(0xFF0066FF);

  static List<Color> gradientColors = [
    Color(0xFF0066FF).withOpacity(0.85),
    Color(0xFF0066FF).withOpacity(0.85),
  ];
  static List<double> gradientStops = [0.0, 1.0];
}
