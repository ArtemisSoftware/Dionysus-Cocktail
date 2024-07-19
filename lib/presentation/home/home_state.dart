import 'package:dio/dio.dart';
import 'package:dionysus_cocktail/domain/models/drink.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final List<Drink> drinks;
  final DioException ? error;

  const HomeState(this.drinks,this.error);

  @override
  List<Object> get props => [drinks, error!];
}

class Loading extends HomeState {
  const Loading(): super(const [], null);
}

class RemoteArticlesDone extends HomeState {
  const RemoteArticlesDone(List<Drink> drinks) : super(drinks, null);
}

class Error extends HomeState {
  const Error(DioException error) : super(const [], error);
}