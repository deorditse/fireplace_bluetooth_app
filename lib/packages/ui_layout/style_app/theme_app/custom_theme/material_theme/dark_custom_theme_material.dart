import 'package:flutter/material.dart';

///Theme Material Dark__________________________________________________________________________________________________________________________________________
ThemeData _themeDark = ThemeData.dark();
ThemeData themeDark = _themeDark.copyWith(
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  appBarTheme: AppBarTheme(
    toolbarHeight: 40,
    color: Colors.cyan,
  ),
  primaryColor: Colors.cyan,

  textTheme: _textDart(_themeDark.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textDart(TextTheme baseTextThemeDark) {
  //base - нащ базовый стиль
  return baseTextThemeDark.copyWith(
    bodyText1: baseTextThemeDark.bodyText1?.copyWith(
      color: Colors.cyan,
    ),
    bodyText2: baseTextThemeDark.bodyText2?.copyWith(
      color: Colors.yellow, //для дефолтного текста
    ),
  );
}
