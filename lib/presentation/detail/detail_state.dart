import 'package:equatable/equatable.dart';

import '../../domain/models/drink.dart';

abstract class DetailState extends Equatable {
  final List<Drink> drinks;

  const DetailState(this.drinks);

  @override
  List<Object> get props => [drinks];
}

class Loading extends DetailState {
  const Loading(): super(const []);
}

class DrinksDone extends DetailState {
  const DrinksDone(List<Drink> drinks) : super(drinks);
}