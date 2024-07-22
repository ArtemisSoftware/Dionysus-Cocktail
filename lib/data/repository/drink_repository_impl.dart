import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dionysus_cocktail/data/mapper/drink_mapper.dart';
import 'package:dionysus_cocktail/data/network/cocktail_api.dart';
import 'package:dionysus_cocktail/data/network/dto/drink_dto.dart';
import 'package:dionysus_cocktail/domain/models/drink.dart';

import 'package:dionysus_cocktail/domain/resource.dart';
import 'package:logger/logger.dart';

import '../../domain/repository/drink_repository.dart';
final logger = Logger();
class DrinkRepositoryImpl implements DrinkRepository {
  final CocktailApi _cocktailApi;

  DrinkRepositoryImpl(this._cocktailApi);

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

}
