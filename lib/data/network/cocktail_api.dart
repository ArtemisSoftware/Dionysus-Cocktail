

import 'package:dionysus_cocktail/data/network/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/drink_dto.dart';
import 'package:dio/dio.dart';

part 'cocktail_api.g.dart';

@RestApi(baseUrl:BASE_URL)
abstract class CocktailApi {

  factory CocktailApi(Dio dio) = _CocktailApi;

  @GET('/search.php')
  Future<HttpResponse<List<DrinkDto>>> getDrinks(
      {
       @Query("s") String name,
     }
  );
}