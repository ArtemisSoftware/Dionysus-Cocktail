import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dionysus_cocktail/data/mapper/drink_mapper.dart';
import 'package:dionysus_cocktail/data/network/cocktail_api.dart';
import 'package:dionysus_cocktail/data/network/dto/drink_dto.dart';
import 'package:dionysus_cocktail/domain/models/drink.dart';

import 'package:dionysus_cocktail/domain/resource.dart';
import 'package:logger/logger.dart';

import '../../domain/repository/drink_repository.dart';
import '../database/app_database.dart';
import '../database/entities/drink_entity.dart';

class DrinkRepositoryImpl implements DrinkRepository {
  final CocktailApi _cocktailApi;
  final AppDatabase _appDatabase;

  DrinkRepositoryImpl(this._cocktailApi, this._appDatabase);

  @override
  Future<Resource<List<Drink>>> getDrinks(String name) async {
    try {

      final httpResponse = await _cocktailApi.getDrinks(name);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Success((httpResponse.data.map((item) => DrinkMapper.toDrink(item)).toList()));
      } else {
        return Failed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return Failed(e);
    }
  }

  @override
  Future<List<Drink>> getSavedDrinks() async {

    final List<DrinkEntity> drinkEntities = await _appDatabase.drinkDao.getDrinks();
    final List<Drink> drinks = drinkEntities.map((item) => DrinkMapper.fromEntity(item)).toList();

    return drinks;
  }

  @override
  Future<void> removeDrink(Drink drink) {
    return _appDatabase.drinkDao.deleteDrink(DrinkMapper.toEntity(drink));
  }

  @override
  Future<void> saveDrink(Drink drink) {
    return _appDatabase.drinkDao.insertDrink(DrinkMapper.toEntity(drink));
  }

}
