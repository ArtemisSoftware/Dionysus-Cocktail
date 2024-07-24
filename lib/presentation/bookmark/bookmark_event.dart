import 'package:equatable/equatable.dart';

import '../../domain/models/drink.dart';

abstract class BookmarkEvent extends Equatable {
  final Drink ? drink;

  const BookmarkEvent({this.drink});

  @override
  List<Object> get props => [drink!];
}

class GetSavedDrinks extends BookmarkEvent {
  const GetSavedDrinks();
}

class RemoveDrink extends BookmarkEvent {
  const RemoveDrink(Drink drink) : super(drink: drink);
}
