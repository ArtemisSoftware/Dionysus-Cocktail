import 'package:dionysus_cocktail/domain/models/drink.dart';
import 'package:dionysus_cocktail/domain/repository/drink_repository.dart';
import 'package:dionysus_cocktail/domain/resource.dart';

class GetDrinksUseCase {

  final DrinkRepository _drinkRepository;

  GetDrinksUseCase(this._drinkRepository);

  Future<Resource<List<Drink>>> call(String name) {
    return _drinkRepository.getDrinks(name);
  }
}