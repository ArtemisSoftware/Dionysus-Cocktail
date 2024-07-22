import 'package:flutter/material.dart';

import '../../ui/color.dart';

AppBarTheme topBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: gray),
    titleTextStyle: TextStyle(color: gray, fontSize: 18),
  );
}