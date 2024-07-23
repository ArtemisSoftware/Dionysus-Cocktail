import 'package:dionysus_cocktail/domain/models/drink.dart';
import 'package:dionysus_cocktail/domain/usecases/get_saved_drinks_use_case.dart';
import 'package:dionysus_cocktail/domain/usecases/remove_drink_use_case.dart';
import 'package:dionysus_cocktail/domain/usecases/save_drink_use_case.dart';
import 'package:dionysus_cocktail/presentation/detail/detail_event.dart';
import 'package:dionysus_cocktail/presentation/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Bloc<DetailEvent,DetailState> {
  final GetSavedDrinksUseCase _getSavedDrinksUseCase;
  final SaveDrinkUseCase _saveDrinkUseCase;
  final RemoveDrinkUseCase _removeDrinkUseCase;

  DetailBloc(
      this._getSavedDrinksUseCase,
      this._saveDrinkUseCase,
      this._removeDrinkUseCase
      ) : super(const Loading()){
    on <GetSavedDrinks> (onGetSavedDrinks);
    on <RemoveDrink> (onRemoveDrink);
    on <SaveDrink> (onSaveDrink);
  }


  void onGetSavedDrinks(GetSavedDrinks event, Emitter<DetailState> emit) async {
    final drinks = await _getSavedDrinksUseCase();
    emit(DrinksDone(drinks));
  }

  void onRemoveDrink(RemoveDrink event, Emitter<DetailState> emit) async {
    await _removeDrinkUseCase(event.drink);

    final articles = await _getSavedDrinksUseCase();
    emit(DrinksDone(articles));
  }

  void onSaveDrink(SaveDrink event, Emitter<DetailState> emit) async {
    await _saveDrinkUseCase(event.drink);

    final articles = await _getSavedDrinksUseCase();
    emit(DrinksDone(articles));
  }

}