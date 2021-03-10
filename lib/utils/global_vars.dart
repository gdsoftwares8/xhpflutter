import 'dart:ui';

import 'package:flutter/material.dart';

import 'GlobalFuncs.dart';

class GlobalVars {
  static String URL = "http://dev.gdsoftwares.com:3003/";
  static String BASE_URL = URL+"api/";
  static String REGISTER_URL = BASE_URL+"auth/register";
  static String LOGIN_URL = BASE_URL+"auth/login";
  static String EMAIL_VERIFIED_URL = BASE_URL+"auth/checkEmailVerified";
  static String PASSWORD_RECOVERY_URL = BASE_URL+"auth/checkEmailVerified";
  static String CATEGORIES_URL = BASE_URL+"category/getCategories";
  static String SONG_BY_CATEGORY_URL = BASE_URL+"song/getSongsByCategoryID";

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

  // fields for global managing
  static int CurrentPlaylist_Position = -1;
  static int CurrentSong_Position = -1;

  static String NO_SONG_FOUND = "Nessuna canzone trovata";
  static String NO_PLAYLIST_FOUND = "Nessuna playlist trovata";
  static String PLAYLIST_NAME_NEEDED = "È necessario il nome della playlist";
  static String TAP_ON_PLAYLIST_TO_ADD_SONG = "Tocca qualsiasi playlist per aggiungere una canzone";
  static String PLAYLIST_CREATED = "Playlist creata";
  static String ERROR_PLAYLIST_CREATING = "Errore nella creazione della playlist";
  static String SELECT_ATLEAST_ONE_SONG = "Seleziona almeno una canzone";
  static String SONG_ADDED = "Canzone aggiunta";
  static String ERROR_SONG_ADDING = "Errore durante l'aggiunta del brano";
  static String NO_CATEGORY_FOUND = "Nessuna categoria trovata";
  static String TRACKS = "brani";
  static String ENTER_NAME = "Inserisci il nome.";
  static String ENTER_VALID_EMAIL = "Inserire una email valida, grazie.";
  static String ENTER_PASSWORD = "Per favore, inserisci la password.";
  static String ENTER_CONFIRM_PASSWORD = "Immettere confermare la password.";
  static String PASSWORD_NOT_MATCHED = "Password e Conferma password non corrispondono";
  static String ALL_FIELDS_ARE_REQUIRED = "Tutti i campi sono obbligatori. Immettere informazioni valide";
  static String PLAYER_ERROR = "Errore del giocatore";
  static String EMPTY_SLOT = "Slot vuoto";
  static String SELECT_PLAYLIST_TO_PLAY = "Seleziona la playlist per riprodurre l'audio";
  static String NO_MORE_SONG_IN_PLAYLIST = "Nessun altro brano nella playlist corrente";


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
  static final Color accentColor = Color(0xFF736881);
  static final Color primaryColorDark = Color(0xFF522B83);

  static List<Color> gradientColors = [
    Color(0xFF4A2072).withOpacity(0.85),
    Color(0xFF8960B8).withOpacity(0.85),
  ];
  static List<double> gradientStops = [0.0, 1.0];
}
