import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/main.dart';
import 'package:calculator/theme_manager.dart';
import 'package:calculator/storage_manager.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class paddingsAndColorsInThemes {
  static EdgeInsets defaultThemeChosen =
      EdgeInsets.only(top: 10, left: 10, right: 10);
  static EdgeInsets lightThemeChosen = EdgeInsets.all(0);
  static EdgeInsets darkThemeChosen = EdgeInsets.all(0);
  static Color defaultThemeChosenBorderColor = Colors.blue;
  static Color lightThemeChosenBorderColor = Colors.transparent;
  static Color darkThemeChosenBorderColor = Colors.transparent;
  static EdgeInsets circularButtonsChosen = EdgeInsets.all(0);
  static EdgeInsets roundedButtonsChosen =
      EdgeInsets.only(top: 10, left: 10, right: 10);
  static EdgeInsets boxedButtonsChosen = EdgeInsets.all(0);
  static Color circularButtonsChosenBorderColor = Colors.transparent;
  static Color roundedButtonsChosenBorderColor = Colors.blue;
  static Color boxedButtonsChosenBorderColor = Colors.transparent;

  static String buttonsStylePath = 'images/default/';
}

class _SettingsPageState extends State<SettingsPage> {
  String languageDropDownMenuValue = 'English 🇺🇸🇬🇧';

  String titleText = "Settings";
  String chooseThemeModeText = 'Choose theme mode';
  String defaultThemeModeText = 'Default';
  String lightThemeModeText = 'Light';
  String darkThemeModeText = 'Dark';
  String chooseButtonStyleText = 'Choose buttons style';
  String circularButtonStyleText = 'Circular';
  String roundedButtonStyleText= 'Rounded';
  String squaredButtonStyleText = 'Squared';

  var dropDownLanguages = [
    'English 🇺🇸🇬🇧',
    'Ukrainian 🇺🇦',
    'Polish 🇵🇱',
    // 'Spanish 🇪🇸',
    // 'French 🇫🇷',
    // 'German 🇩🇪',
    // 'Portugal 🇵🇹',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
            Navigator.of(context).pop();
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text(titleText),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  chooseThemeModeText,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'BAHNSCHRIFT',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
        // Themes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: theme.setCustomMode,
                        child: Container(
                          padding: paddingsAndColorsInThemes.defaultThemeChosen,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: paddingsAndColorsInThemes
                                  .defaultThemeChosenBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Image.asset('images/default_mode.png', width: 80),
                              ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () => {
                                  paddingsAndColorsInThemes.buttonsStylePath = 'images/default/',
                                  theme.setCustomMode(),
                                },
                                child: Text(
                                  defaultThemeModeText,
                                  style: TextStyle(
                                    fontFamily: 'BAHNSCHRIFT',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: theme.setLightMode,
                      child: Container(
                        padding: paddingsAndColorsInThemes.lightThemeChosen,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: paddingsAndColorsInThemes
                                .lightThemeChosenBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset('images/light_mode.png', width: 80),
                            ElevatedButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => {
                                paddingsAndColorsInThemes.buttonsStylePath = 'images/light/',
                                theme.setLightMode(),
                              },
                              child: Text(
                                lightThemeModeText,
                                style: TextStyle(
                                  fontFamily: 'BAHNSCHRIFT',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: theme.setDarkMode,
                      child: Container(
                        padding: paddingsAndColorsInThemes.darkThemeChosen,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: paddingsAndColorsInThemes
                                .darkThemeChosenBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset('images/dark_mode.png', width: 80),
                            ElevatedButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => {
                                paddingsAndColorsInThemes.buttonsStylePath = 'images/dark/',
                                theme.setDarkMode(),
                              },
                              child: Text(
                                darkThemeModeText,
                                style: TextStyle(
                                  fontFamily: 'BAHNSCHRIFT',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  chooseButtonStyleText,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'BAHNSCHRIFT',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
        // Buttons style
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: theme.setCircleButtons,
                        child: Container(
                          padding:
                              paddingsAndColorsInThemes.circularButtonsChosen,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: paddingsAndColorsInThemes
                                  .circularButtonsChosenBorderColor,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Image.asset(paddingsAndColorsInThemes.buttonsStylePath + 'circular.png', width: 80),
                              ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () => {
                                  theme.setCircleButtons(),
                                },
                                child: Text(
                                  circularButtonStyleText,
                                  style: TextStyle(
                                    fontFamily: 'BAHNSCHRIFT',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: theme.setRoundedButtons,
                      child: Container(
                        padding: paddingsAndColorsInThemes.roundedButtonsChosen,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: paddingsAndColorsInThemes
                                .roundedButtonsChosenBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset(paddingsAndColorsInThemes.buttonsStylePath + 'rounded.png', width: 80),
                            ElevatedButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => {
                                theme.setRoundedButtons(),
                              },
                              child: Text(
                                roundedButtonStyleText,
                                style: TextStyle(
                                  fontFamily: 'BAHNSCHRIFT',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: theme.setBoxButtons,
                      child: Container(
                        padding: paddingsAndColorsInThemes.boxedButtonsChosen,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: paddingsAndColorsInThemes
                                .boxedButtonsChosenBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset(paddingsAndColorsInThemes.buttonsStylePath + 'boxed.png', width: 80),
                            ElevatedButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () => {
                                theme.setBoxButtons(),
                              },
                              child: Text(
                                squaredButtonStyleText,
                                style: TextStyle(
                                  fontFamily: 'BAHNSCHRIFT',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Choose language',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'BAHNSCHRIFT',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
        // Language
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: DropdownButton(
                        dropdownColor: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
        
                        // Initial Value
                        value: languageDropDownMenuValue,
        
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
        
                        // Array list of items
                        items: dropDownLanguages.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'BAHNSCHRIFT',
                              ),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            languageDropDownMenuValue = newValue!;
                            if (languageDropDownMenuValue == 'English 🇺🇸🇬🇧') {
                              titleText = "Settings";
                              chooseThemeModeText = 'Choose theme mode';
                              defaultThemeModeText = 'Default';
                              lightThemeModeText = 'Light';
                              darkThemeModeText = 'Dark';
                              chooseButtonStyleText = 'Choose buttons style';
                              circularButtonStyleText = 'Circular';
                              roundedButtonStyleText= 'Rounded';
                              squaredButtonStyleText = 'Squared';
                            } else if (languageDropDownMenuValue == 'Ukrainian 🇺🇦') {
                              titleText = "Налаштування";
                              chooseThemeModeText = 'Оберіть тему';
                              defaultThemeModeText = 'Початкова';
                              lightThemeModeText = 'Світла';
                              darkThemeModeText = 'Темна';
                              chooseButtonStyleText = 'Оберіть стиль кнопок';
                              circularButtonStyleText = 'Круглі';
                              roundedButtonStyleText= 'Заокруглені';
                              squaredButtonStyleText = 'Квадратні';
                            } else if (languageDropDownMenuValue == 'Polish 🇵🇱') {
                              titleText = "Ustawienia";
                              chooseThemeModeText = 'Wybierz tryb motywu';
                              defaultThemeModeText = 'Domyślna';
                              lightThemeModeText = 'Światło';
                              darkThemeModeText = 'Ciemny';
                              chooseButtonStyleText = 'Wybierz styl przycisków';
                              circularButtonStyleText = 'Okrągły';
                              roundedButtonStyleText= 'Bułczasty';
                              squaredButtonStyleText = 'Kwadrat';
                            }
            // 'Spanish 🇪🇸',
            // 'French 🇫🇷',
            // 'German 🇩🇪',
            // 'Portugal 🇵🇹',
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
