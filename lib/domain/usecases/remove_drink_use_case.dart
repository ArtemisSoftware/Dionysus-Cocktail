import '../models/drink.dart';
import '../repository/drink_repository.dart';

class RemoveDrinkUseCase {

  final DrinkRepository _drinkRepository;

  RemoveDrinkUseCase(this._drinkRepository);

  Future<void> call(Drink drink) {
    return _drinkRepository.removeDrink(drink);
  }
}