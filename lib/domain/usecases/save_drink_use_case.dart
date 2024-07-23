import '../models/drink.dart';
import '../repository/drink_repository.dart';

class SaveDrinkUseCase {

  final DrinkRepository _drinkRepository;

  SaveDrinkUseCase(this._drinkRepository);

  Future<void> call(Drink drink) {
    return _drinkRepository.saveDrink(drink);
  }
}