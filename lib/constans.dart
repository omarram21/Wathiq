import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final MaterialColor BACKGROUND = hex('#0D1724');
  static final MaterialColor BLUE = hex('#514BC3');
  static final MaterialColor GRAY = hex('#707070');
  static final MaterialColor WHITE = hex('#FFFFFF');
  static final MaterialColor RED = hex('#FF0000');

  static MaterialColor hex(String hex) =>
      AppColors._factoryColor(AppColors._getColorHexFromStr(hex));

  static MaterialColor _factoryColor(int color) {
    return MaterialColor(color, <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    });
  }

  static int _getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        val = 0xFFFFFFFF;
      }
    }
    return val;
  }
}

class Themes {
  // static final light = ThemeData.light().copyWith(
  //   backgroundColor: AppColors.BACK_GROUN,
  //   bottomAppBarColor: Colors.cyan,
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: Colors.cyan,
  //     textTheme: ButtonTextTheme.primary,
  //   ),
  // );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.BACKGROUND,
    // buttonColor: AppColors.BLUE,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    iconTheme: IconThemeData(
      color: Colors.white,
    ),

    // brightness: Brightness.light,
    // textTheme: TextTheme()
    // primaryColor: Colors.red,
    // primaryColorLight: white2,
    // primaryColorDark: AppColors.BLUE,

    // brightness: Brightness.dark,
    // primaryColor: Colors.amber,
    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.amber,
    //   disabledColor: Colors.grey,
    // )
    //    primaryColor: black,
    // colorScheme: themeData.colorScheme.copyWith(
    //   primary: black,
    //   secondary: black,
    // ),
  );
}
