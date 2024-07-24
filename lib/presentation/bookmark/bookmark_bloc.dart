import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_saved_drinks_use_case.dart';
import '../../domain/usecases/remove_drink_use_case.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent,BookmarkState> {
  final GetSavedDrinksUseCase _getSavedDrinksUseCase;
  final RemoveDrinkUseCase _removeDrinkUseCase;

  BookmarkBloc(
      this._getSavedDrinksUseCase,
      this._removeDrinkUseCase
      ) : super(const Loading()){
    on <GetSavedDrinks> (onGetSavedDrinks);
    on <RemoveDrink> (onRemoveDrink);
  }


  void onGetSavedDrinks(GetSavedDrinks event, Emitter<BookmarkState> emit) async {
    final drinks = await _getSavedDrinksUseCase();
    emit(DrinksDone(drinks));
  }

  void onRemoveDrink(RemoveDrink event, Emitter<BookmarkState> emit) async {
    await _removeDrinkUseCase(event.drink!);

    final articles = await _getSavedDrinksUseCase();
    emit(DrinksDone(articles));
  }

}