import 'package:dionysus_cocktail/domain/models/drink.dart';
import 'package:dionysus_cocktail/presentation/bookmark/bookmark.dart';
import 'package:dionysus_cocktail/presentation/home/home.dart';
import 'package:flutter/material.dart';

import '../detail/detail.dart';

class Routes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Home());

      case '/Details':
        return _materialRoute(Detail(drink: settings.arguments as Drink));

      case '/SavedDrinks':
        return _materialRoute(const Bookmark());

      default:
        return _materialRoute(const Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}