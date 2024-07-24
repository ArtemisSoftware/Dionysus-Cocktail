import 'package:equatable/equatable.dart';

import '../../domain/models/drink.dart';

abstract class BookmarkState extends Equatable {
  final List<Drink> drinks;

  const BookmarkState(this.drinks);

  @override
  List<Object> get props => [drinks];
}

class Loading extends BookmarkState {
  const Loading(): super(const []);
}

class DrinksDone extends BookmarkState {
  const DrinksDone(List<Drink> drinks) : super(drinks);
}