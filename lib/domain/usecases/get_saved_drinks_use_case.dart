import 'package:dionysus_cocktail/domain/models/drink.dart';

import '../repository/drink_repository.dart';

class GetSavedDrinksUseCase {

  final DrinkRepository _drinkRepository;

  GetSavedDrinksUseCase(this._drinkRepository);

  Future<List<Drink>> call() {
    return _drinkRepository.getSavedDrinks();
  }
}