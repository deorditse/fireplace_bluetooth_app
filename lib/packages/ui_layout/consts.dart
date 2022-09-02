import 'package:flutter/material.dart';

Color myColorActivity = Color.fromRGBO(253, 133, 0, 1);
// Color myMainColor = Colors.white;
Color myTwoColor = Color.fromRGBO(176, 172, 165, 1);

BoxDecoration get myDecorationBackground => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.4, 1.0],
        colors: [
          Color.fromRGBO(78, 77, 77, 1),
          Color.fromRGBO(43, 42, 42, 1),
          Color.fromRGBO(9, 7, 7, 1),
        ],
        tileMode: TileMode.clamp,
      ),
    );

TextStyle textStyleFontSarpanch({double? fontSize, Color? textColor}) =>
    TextStyle(
      color: textColor ?? Colors.white,
      fontFamily: 'Sarpanch',
      fontSize: fontSize ?? 16,
    );

TextStyle textStyleFontRoboto({double? fontSize, Color? textColor}) =>
    TextStyle(
      color: textColor ?? Colors.white,
      fontFamily: 'Roboto',
      fontSize: fontSize ?? 16,
    );
