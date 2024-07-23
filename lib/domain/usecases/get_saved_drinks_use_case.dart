import '../repository/drink_repository.dart';

class GetSavedDrinksUseCase {

  final DrinkRepository _drinkRepository;

  GetSavedDrinksUseCase(this._drinkRepository);

  Future<void> call() {
    return _drinkRepository.getSavedDrinks();
  }
}