import 'package:dionysus_cocktail/domain/models/drink.dart';

import '../../data/network/dto/drink_dto.dart';
import '../resource.dart';

abstract class DrinkRepository {
  // API methods
  Future<Resource<List<Drink>>> getDrinks(String name);

  // // Database methods
  // Future < List < ArticleEntity >> getSavedArticles();
  //
  // Future < void > saveArticle(ArticleEntity article);
  //
  // Future < void > removeArticle(ArticleEntity article);
}