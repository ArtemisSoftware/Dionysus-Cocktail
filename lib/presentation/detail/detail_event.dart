import 'package:equatable/equatable.dart';

import '../../domain/models/drink.dart';

abstract class DetailEvent extends Equatable {
  final Drink drink;

  const DetailEvent(this.drink);

  @override
  List<Object> get props => [drink];
}

class GetSavedDrinks extends DetailEvent {
  const GetSavedDrinks(super.drink);
}

class RemoveDrink extends DetailEvent {
  const RemoveDrink(Drink drink) : super(drink);
}

class SaveDrink extends DetailEvent {
  const SaveDrink(Drink drink) : super(drink);
}