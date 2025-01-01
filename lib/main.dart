import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:calculator/theme_manager.dart';
import 'package:calculator/buttons.dart';
import 'package:calculator/settings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final themeNotifier = ThemeNotifier();
  await themeNotifier.init();
  return runApp(ChangeNotifierProvider<ThemeNotifier>.value(
    value: themeNotifier,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: CalculatorPage(),
      )
    );
  }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}





class themeColorsClass {
  static Color freezeAnswerTextColor = Colors.white;
  static Color mainBackgroundColor = Color.fromARGB(255, 116, 48, 137); //160, 32, 240
  static Color historyQuestionTextColor = Colors.white;
  static Color userAnswerTextColor = Colors.white;
  static Color clearBtnBgColor = Color.fromARGB(255, 252, 155, 36);
  static Color clearBtnTextColor = Color.fromARGB(255, 96, 0, 164);
  static Color deleteBtnBgColor = Colors.red;
  static Color deleteBtnTextColor = Colors.white;
  static Color freezeBtnBgColor = Color.fromARGB(255, 106, 165, 234);
  static Color freezeBtnTextColor = Colors.white;
  static Color equalBtnBgColor = Color.fromARGB(255, 252, 155, 36);
  static Color equalBtnTextColor = Color.fromARGB(255, 96, 0, 164);
  static Color settingsBtnBgColor = Color.fromARGB(255, 144, 166, 180);
  static Color settingsBtnTextColor = Colors.white;
  static Color numberBtnsBgColor = Colors.white;
  static Color numberBtnsTextColor = Color.fromARGB(255, 96, 0, 164);
  static Color operatorsBtnsBgColor = Color.fromARGB(255, 96, 0, 164);
  static Color operatorsBtnsTextColor = Color.fromARGB(255, 255, 204, 143);
  static Shadow setShadow = Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),);
}






class _CalculatorPageState extends State<CalculatorPage> {
  var freezeAnswer = '';
  var freezeAnswer2 = '';
  var freezeAnswer3 = '';
  var userAnswer = '0';
  bool equalButtonPressed = false;
  var historyQuestion1 = '';
  var historyQuestion2 = '';
  var historyQuestion3 = '';
  var historyQuestion4 = '';
  int clearButtonPressedTwice = 0;
  int nowAnswerOccupied = 0;
  double userTextFontSize = 76;
  double buttonsFontSize = 22;

  bool _isEnable = false;

  final List<dynamic> buttons = [
    'C',
    'DEL',
    '❄️',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '⚙️',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColorsClass.mainBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 10, right: 10, left: 15),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              freezeAnswer.length > 9 ? freezeAnswer.substring(0, 9) : freezeAnswer,
                              style: TextStyle(
                                color: themeColorsClass.freezeAnswerTextColor,
                                fontSize: 22,
                                fontFamily: 'BAHNSCHRIFT',
                              ),
                            ),
                            SelectableText(
                              freezeAnswer2.length > 9 ? freezeAnswer2.substring(0, 9) : freezeAnswer2,
                              style: TextStyle(
                                color: themeColorsClass.freezeAnswerTextColor,
                                fontSize: 22,
                                fontFamily: 'BAHNSCHRIFT',
                              ),
                            ),
                            SelectableText(
                              freezeAnswer3.length > 9 ? freezeAnswer3.substring(0, 9) : freezeAnswer3,
                              style: TextStyle(
                                color: themeColorsClass.freezeAnswerTextColor,
                                fontSize: 22,
                                fontFamily: 'BAHNSCHRIFT',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SelectableText(
                              historyQuestion4,
                              style: TextStyle(
                                decorationThickness: 0.001,
                                color: themeColorsClass.historyQuestionTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BAHNSCHRIFT',
                                height: 1,
                              ),
                            ),
                            SelectableText(
                              historyQuestion3,
                              style: TextStyle(
                                color: themeColorsClass.historyQuestionTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BAHNSCHRIFT',
                                height: 1,
                              ),
                            ),
                            SelectableText(
                              historyQuestion2,
                              style: TextStyle(
                                color: themeColorsClass.historyQuestionTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BAHNSCHRIFT',
                                height: 1,
                              ),
                            ),
                            SelectableText(
                              historyQuestion1,
                              style: TextStyle(
                                color: themeColorsClass.historyQuestionTextColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BAHNSCHRIFT',
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 218,
                  padding:
                      EdgeInsets.only(left: 18, right: 18, bottom: 16),
                  alignment: Alignment.bottomRight,
                  child: SelectableText (
                    userAnswer,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: themeColorsClass.userAnswerTextColor,
                      fontSize: userTextFontSize,
                      fontFamily: 'BAHNSCHRIFT',
                    ),
                  ),
                ),
              ],
            )
          ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              color: themeColorsClass.mainBackgroundColor,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear button
                  if (index == 0) {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          userAnswer = '0';
                          clearButtonPressedTwice += 1;
                          if (clearButtonPressedTwice == 2) {
                            clearButtonPressedTwice = 0;
                            freezeAnswer = '';
                            freezeAnswer2 = '';
                            freezeAnswer3 = '';
                            historyQuestion1 = '';
                            historyQuestion2 = '';
                            historyQuestion3 = '';
                            historyQuestion4 = '';
                          }
                        });
                      },
                      buttonText: buttons[index],
                      color: themeColorsClass.clearBtnBgColor,
                      textColor: themeColorsClass.clearBtnTextColor,
                      textFontSize: buttonsFontSize,
                      applyShadow: Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),),
                    );
                  }
                  // Delete button
                  else if (index == 1) {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          if (userAnswer == ' ') {
                            userAnswer = '0';
                          } else if (userAnswer.length > 0) {
                            userAnswer =
                                userAnswer.substring(0, userAnswer.length - 1);
                          }
                        });
                      },
                      buttonText: buttons[index],
                      color: themeColorsClass.deleteBtnBgColor,
                      textColor: themeColorsClass.deleteBtnTextColor,
                      textFontSize: 22,
                      applyShadow: Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),),
                    );
                  }
                  // Freeze button
                  else if (index == 2) {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          equalButtonPressed = true;
                          if (freezeAnswer == '') {
                            freezeAnswer = userAnswer;
                            nowAnswerOccupied = 1;
                          } else if (freezeAnswer2 == '') {
                            freezeAnswer2 = userAnswer;
                            nowAnswerOccupied = 2;
                          } else if (freezeAnswer3 == '') {
                            freezeAnswer3 = userAnswer;
                            nowAnswerOccupied = 3;
                          } else if (nowAnswerOccupied == 1) {
                            freezeAnswer2 = userAnswer;
                            nowAnswerOccupied = 2;
                          } else if (nowAnswerOccupied == 2) {
                            freezeAnswer3 = userAnswer;
                            nowAnswerOccupied = 3;
                          } else if (nowAnswerOccupied == 3) {
                            freezeAnswer = userAnswer;
                            nowAnswerOccupied = 1;
                          }
                        });
                      },
                      buttonText: buttons[index],
                      color: themeColorsClass.freezeBtnBgColor,
                      textColor: themeColorsClass.freezeBtnTextColor,
                      textFontSize: 30,
                      applyShadow: themeColorsClass.setShadow,
                    );
                  }
                  // Equal button
                  else if (index == 19) {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          historyQuestion4 = historyQuestion3;
                          historyQuestion3 = historyQuestion2;
                          historyQuestion2 = historyQuestion1;
                          historyQuestion1 = userAnswer;
                          equalPressed();
                          equalButtonPressed = true;

                          // historyQuestion1 += "=" + userAnswer;
                        });
                      },
                      buttonText: buttons[index],
                      color: themeColorsClass.equalBtnBgColor,
                      textColor: themeColorsClass.equalBtnTextColor,
                      textFontSize: buttonsFontSize,
                      applyShadow: Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),),
                    );
                  }
                  // Settings button
                  else if (index == 16) {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return SettingsPage();
                              },
                            ),
                          );
                        });
                      },
                      buttonText: buttons[index],
                      color: themeColorsClass.settingsBtnBgColor,
                      textColor: themeColorsClass.settingsBtnTextColor,
                      textFontSize: 30,
                      applyShadow: Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),),
                    );
                  }
                  // Others
                  else {
                    return CalcButtons(
                      buttonPressed: () {
                        setState(() {
                          clearButtonPressedTwice = 0;
                          if (userAnswer == '0' || userAnswer == 'Error') {
                            userAnswer = '';
                          }
                          if (userAnswer == '' && index == 3 ||
                              userAnswer == 'Error' && index == 3 ||
                              userAnswer == '' && index == 7 ||
                              userAnswer == 'Error' && index == 7 ||
                              userAnswer == '' && index == 11 ||
                              userAnswer == 'Error' && index == 11 ||
                              userAnswer == '' && index == 15 ||
                              userAnswer == 'Error' && index == 15) {
                            userAnswer = '0';
                          }
                          if (equalButtonPressed == true) {
                            if (index == 3 ||
                                index == 7 ||
                                index == 11 ||
                                index == 15) {
                              equalButtonPressed = false;
                            } else {
                              equalButtonPressed = false;
                              userAnswer = '';
                            }
                          }
                          if (userAnswer.length < 20) {
                            userAnswer += buttons[index];
                          }
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? themeColorsClass.operatorsBtnsBgColor
                          : themeColorsClass.numberBtnsBgColor,
                      textColor: isOperator(buttons[index])
                          ? themeColorsClass.operatorsBtnsTextColor
                          : themeColorsClass.numberBtnsTextColor,
                      textFontSize: buttonsFontSize,
                      applyShadow: Shadow(blurRadius: 0, color: Colors.black, offset: Offset(0, 0),),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isShadowNeeded(index) {
    if (index == 2) {
      return true;
    }
    return false;
  }

  bool isOperator(String x) {
    if (x == '÷' || x == '×' || x == '-' || x == '+' || x == '%') {
      // || x == '.'
      return true;
    }
    return false;
  }

  void equalPressed() {
    userAnswer = userAnswer.replaceAll('×', '*');
    userAnswer = userAnswer.replaceAll('÷', '/');

    try {
      Parser p = Parser();
      Expression exp = p.parse(userAnswer);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      if (eval % 1 == 0.0) {
        userAnswer = eval.round().toString();
      } else {
        userAnswer = eval.toStringAsFixed(2);
      }

    } catch (e) {
      // Catches all types of `Exception` and `Error`.
      userAnswer = "Error";
    }

    //userAnswer = eval.round().toString();
  }
}
