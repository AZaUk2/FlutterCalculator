import 'package:flutter/material.dart';
import 'package:calculator/storage_manager.dart';
import 'package:calculator/main.dart';
import 'package:calculator/settings.dart';
import 'package:calculator/buttons.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;




class ThemeNotifier with ChangeNotifier {
  final customTheme = ThemeData(
    primarySwatch: primaryBlack,
  );

  final darkTheme = ThemeData(
    primarySwatch: primaryBlack,

  );

  final lightTheme = ThemeData(
    primarySwatch: primaryBlack,

  );
  

  late ThemeData _themeData;
  var _buttonsData;

  ThemeData getTheme() => _themeData;
  getButtons() => _buttonsData;

  ThemeNotifier();

  Future<void> init() async {
    final themeMode = await StorageManager.readData('themeMode') ?? 'custom';
    final buttonsMode = await StorageManager.readData('buttonsMode') ?? 'rounded';

    if (themeMode == 'light') {
      setLightMode();
    } else if (themeMode == 'dark') {
      setDarkMode();
    } else {
      setCustomMode();
    }

    if (buttonsMode == 'circle') {
      setCircleButtons();
    } else if (buttonsMode == 'rounded') {
      setRoundedButtons();
    } else if (buttonsMode == 'box') {
      setBoxButtons();
    }

    notifyListeners();
  }

  void setCircleButtons() async {
    CalcButtons.buttonsRadius = BorderRadius.circular(100);
    CalcButtons.buttonPadding = EdgeInsets.all(7);
    paddingsAndColorsInThemes.circularButtonsChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.roundedButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.boxedButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.circularButtonsChosenBorderColor = Colors.blue;
    paddingsAndColorsInThemes.roundedButtonsChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.boxedButtonsChosenBorderColor = Colors.transparent;
    _buttonsData = setCircleButtons;
    StorageManager.saveData('buttonsMode', 'circle');
    notifyListeners();
  }

  void setRoundedButtons() async {
    CalcButtons.buttonsRadius = BorderRadius.circular(20);
    CalcButtons.buttonPadding = EdgeInsets.all(5);
    paddingsAndColorsInThemes.circularButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.roundedButtonsChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.boxedButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.circularButtonsChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.roundedButtonsChosenBorderColor = Colors.blue;
    paddingsAndColorsInThemes.boxedButtonsChosenBorderColor = Colors.transparent;
    _buttonsData = setRoundedButtons;
    StorageManager.saveData('buttonsMode', 'rounded');
    notifyListeners();
  }

  void setBoxButtons() async {
    CalcButtons.buttonsRadius = BorderRadius.circular(0);
    CalcButtons.buttonPadding = EdgeInsets.all(0);
    paddingsAndColorsInThemes.circularButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.roundedButtonsChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.boxedButtonsChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.circularButtonsChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.roundedButtonsChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.boxedButtonsChosenBorderColor = Colors.blue;
    _buttonsData = setBoxButtons;
    StorageManager.saveData('buttonsMode', 'box');
    notifyListeners();
  }

  void setCustomMode() async {
    paddingsAndColorsInThemes.buttonsStylePath = 'images/default/';

    themeColorsClass.mainBackgroundColor = Color.fromARGB(255, 167, 96, 255);
    themeColorsClass.freezeAnswerTextColor = Colors.white;
    themeColorsClass.historyQuestionTextColor = Colors.white;
    themeColorsClass.userAnswerTextColor = Colors.white;
    themeColorsClass.clearBtnBgColor = Color.fromARGB(255, 252, 155, 36);
    themeColorsClass.clearBtnTextColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.deleteBtnBgColor = Colors.red;
    themeColorsClass.deleteBtnTextColor = Colors.white;
    themeColorsClass.freezeBtnBgColor = Color.fromARGB(255, 106, 165, 234);
    themeColorsClass.freezeBtnTextColor = Colors.white;
    themeColorsClass.equalBtnBgColor = Color.fromARGB(255, 252, 155, 36);
    themeColorsClass.equalBtnTextColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.settingsBtnBgColor = Color.fromARGB(255, 144, 166, 180);
    themeColorsClass.settingsBtnTextColor = Colors.white;
    themeColorsClass.numberBtnsBgColor = Colors.white;
    themeColorsClass.numberBtnsTextColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.operatorsBtnsBgColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.operatorsBtnsTextColor = Color.fromARGB(255, 255, 204, 143);
    themeColorsClass.setShadow = Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),);
    paddingsAndColorsInThemes.defaultThemeChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.lightThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.darkThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.defaultThemeChosenBorderColor = Colors.blue;
    paddingsAndColorsInThemes.lightThemeChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.darkThemeChosenBorderColor = Colors.transparent;
    _themeData = customTheme;
    StorageManager.saveData('themeMode', 'custom');
    notifyListeners();
  }

  void setDarkMode() async {
    paddingsAndColorsInThemes.buttonsStylePath = 'images/dark/';

    themeColorsClass.mainBackgroundColor = Colors.black;
    themeColorsClass.freezeAnswerTextColor = Colors.white;
    themeColorsClass.historyQuestionTextColor = Colors.white;
    themeColorsClass.userAnswerTextColor = Colors.white;
    themeColorsClass.clearBtnBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.clearBtnTextColor = Color.fromARGB(255, 176, 38, 255);
    themeColorsClass.deleteBtnBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.deleteBtnTextColor = Color.fromARGB(255, 247, 33, 25);
    themeColorsClass.freezeBtnBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.freezeBtnTextColor = Color.fromARGB(255, 131, 238, 255);
    themeColorsClass.equalBtnBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.equalBtnTextColor = Color.fromARGB(255, 176, 38, 255);
    themeColorsClass.settingsBtnBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.settingsBtnTextColor = Color.fromARGB(255, 137, 143, 143);
    themeColorsClass.numberBtnsBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.numberBtnsTextColor = Colors.white;
    themeColorsClass.operatorsBtnsBgColor = Color.fromARGB(137, 33, 33, 33);
    themeColorsClass.operatorsBtnsTextColor = Color.fromARGB(255, 255, 204, 143);
    themeColorsClass.setShadow = Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),);
    paddingsAndColorsInThemes.defaultThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.lightThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.darkThemeChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.defaultThemeChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.lightThemeChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.darkThemeChosenBorderColor = Colors.blue;
    _themeData = darkTheme;    
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    paddingsAndColorsInThemes.buttonsStylePath = 'images/light/';

    themeColorsClass.mainBackgroundColor = Colors.white;
    themeColorsClass.freezeAnswerTextColor = Colors.black;
    themeColorsClass.historyQuestionTextColor = Colors.black;
    themeColorsClass.userAnswerTextColor = Colors.black;
    themeColorsClass.clearBtnBgColor = Color.fromARGB(255, 255, 204, 143);
    themeColorsClass.clearBtnTextColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.deleteBtnBgColor = Color.fromARGB(255, 245, 98, 93);
    themeColorsClass.deleteBtnTextColor = Colors.white;
    themeColorsClass.freezeBtnBgColor = Color.fromARGB(255, 155, 208, 229);
    themeColorsClass.freezeBtnTextColor = Colors.black;
    themeColorsClass.equalBtnTextColor = Color.fromARGB(255, 255, 204, 143);
    themeColorsClass.equalBtnBgColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.settingsBtnBgColor = Color.fromARGB(255, 178, 186, 186);
    themeColorsClass.settingsBtnTextColor = Colors.black;
    themeColorsClass.numberBtnsBgColor = Color.fromARGB(255, 237, 237, 237);
    themeColorsClass.numberBtnsTextColor = Colors.black;
    themeColorsClass.operatorsBtnsBgColor = Color.fromARGB(255, 255, 204, 143);
    themeColorsClass.operatorsBtnsTextColor = Color.fromARGB(255, 96, 0, 164);
    themeColorsClass.setShadow = Shadow(blurRadius: 35.0, color: Colors.black54, offset: Offset(0, 0),);
    paddingsAndColorsInThemes.defaultThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.lightThemeChosen = EdgeInsets.only(top: 10, left: 10, right: 10);
    paddingsAndColorsInThemes.darkThemeChosen = EdgeInsets.all(0);
    paddingsAndColorsInThemes.defaultThemeChosenBorderColor = Colors.transparent;
    paddingsAndColorsInThemes.lightThemeChosenBorderColor = Colors.blue;
    paddingsAndColorsInThemes.darkThemeChosenBorderColor = Colors.transparent;
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}