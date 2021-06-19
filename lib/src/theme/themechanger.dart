import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        /* _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.redAccent
        ); */
        break;
      case 2: //Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: // Personalizado
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
      /* _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.redAccent
        ); */
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          accentColor: Colors.pink,
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202B));
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
