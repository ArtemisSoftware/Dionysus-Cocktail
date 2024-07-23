import 'package:dionysus_cocktail/data/database/dao/drink_dao.dart';
import 'package:dionysus_cocktail/data/database/entities/drink_entity.dart';
import 'package:floor/floor.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [DrinkEntity])
abstract class AppDatabase extends FloorDatabase {
  DrinkDao get drinkDao;
}