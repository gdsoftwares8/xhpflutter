import 'dart:ui';

import 'package:flutter/material.dart';

import 'GlobalFuncs.dart';

class GlobalVars {
  static String URL = "http://rupeestreet.com/xhpbackend/";
  static String BASE_URL = URL+"api/";
  static String REGISTER_URL = BASE_URL+"auth/register";
  static String LOGIN_URL = BASE_URL+"auth/login";
  static String GET_PROFILE_URL = BASE_URL+"account";
  static String UPDATE_PROFILE_URL = BASE_URL+"account/update_account";
  static String APPOINTMENTS_URL = BASE_URL+"appointments";
  static String BOOK_APPOINTMENT_URL = BASE_URL+"appointments/bookAppointment";

  static String EMAIL_VERIFIED_URL = BASE_URL+"auth/checkEmailVerified";
  static String PASSWORD_RECOVERY_URL = BASE_URL+"auth/checkEmailVerified";

  static String INVOICES_URL = BASE_URL+"invoice";
  static String GIFTS_URL = BASE_URL+"gift";
  static String ADD_GIFT_URL = BASE_URL+"gift/add";
  static String TERMS_URL = BASE_URL+"getTermsAndCondition";

  // Constants For Prefrences
  static String isLogin = "isLogin";
  static String user = "user";
  static String isVerified = "isVerified";
  static String isPaymentDone = "isPaymentDone";
  static String id = "_id";
  static String name = "name";
  static String email = "email";
  static String phone = "phone";
  static String password = "password";

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

  static Color borderColor = GlobalFunc.colorFromHex('#707070');
  static Color widgetColor = GlobalFunc.colorFromHex('#7B52AB');
  static final Color opacityColor = Color.fromRGBO(123, 82, 171, 0.94);
  static final MaterialColor primaryColor = MaterialColor(0xFF7B52AB,
      const <int, Color> {
        50: const Color(0xFF7B52AB),
        100: const Color(0xFF7B52AB),
        200: const Color(0xFF7B52AB),
        300: const Color(0xFF7B52AB),
        400: const Color(0xFF7B52AB),
        500: const Color(0xFF7B52AB),
        600: const Color(0xFF7B52AB),
        700: const Color(0xFF7B52AB),
        800: const Color(0xFF7B52AB),
        900: const Color(0xFF7B52AB),
      });
  static final Color accentColor = Color(0xFF3a1172);
  static final Color primaryColorDark = Color(0xFF522B83);

  static List<Color> gradientColors = [
    Color(0xFF4A2072).withOpacity(0.85),
    Color(0xFF8960B8).withOpacity(0.85),
  ];
  static List<double> gradientStops = [0.0, 1.0];
}
