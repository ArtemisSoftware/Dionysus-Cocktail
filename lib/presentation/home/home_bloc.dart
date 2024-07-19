import 'package:dionysus_cocktail/domain/resource.dart';
import 'package:dionysus_cocktail/domain/usecases/get_drinks_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {

  final GetDrinksUseCase _getDrinksUseCase;

  HomeBloc(this._getDrinksUseCase) : super(const Loading()){
    on <GetDrinks> (_onGetArticles);
  }

  void _onGetArticles(GetDrinks event, Emitter <HomeState> emit) async {
    final result = await _getDrinksUseCase("margarita");

    if (result is Resource && result.data!.isNotEmpty) {
      emit(
          RemoteArticlesDone(result.data!)
      );
    }

    if (result is Failed) {
      emit(
          Error(result.error!)
      );
    }
  }

}