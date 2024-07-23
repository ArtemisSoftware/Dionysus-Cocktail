import 'package:dionysus_cocktail/data/database/entities/drink_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DrinkDao {

  @Insert()
  Future<void> insertDrink(DrinkEntity drinkEntity);

  @delete
  Future<void> deleteDrink(DrinkEntity drinkEntity);

  @Query('SELECT * FROM DrinkEntity')
  Future<List<DrinkEntity>> getDrinks();
}