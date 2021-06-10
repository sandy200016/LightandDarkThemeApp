import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mytheme1 {

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black87),
          textTheme: Theme.of(context).textTheme,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),

        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      );

}

class ThemeNotifier extends ChangeNotifier{
  final String key = "Theme";
  dynamic preferences;
  static late bool darktheme;
  ThemeNotifier(){
    darktheme=true;
    _loadFromPref();
  }
   toggleTheme(){
    darktheme= !darktheme;
    _saveToPrefs();
    notifyListeners();
  }
   dynamic getTheme() => darktheme;

  _initPrefs() async{
    if(preferences==null){
      preferences=await SharedPreferences.getInstance();
    }
  }


  _loadFromPref() async{

    await _initPrefs();
    darktheme = preferences.getBool(key) ?? true;
    notifyListeners();

  }
  _saveToPrefs() async{

    await _initPrefs();
    preferences.setBool(key,darktheme);

  }




}