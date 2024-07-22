import 'package:dionysus_cocktail/presentation/widgets/appbar/top_bar_theme.dart';
import 'package:flutter/material.dart';


ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Muli',
      appBarTheme: topBarTheme()
  );
}