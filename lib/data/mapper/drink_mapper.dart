import 'package:dionysus_cocktail/data/database/entities/drink_entity.dart';
import 'package:dionysus_cocktail/data/network/dto/drink_dto.dart';

import '../../domain/models/drink.dart';

class DrinkMapper {

  static DrinkDto fromJson(Map < String, dynamic > map) {
    return DrinkDto(
      idDrink: map['idDrink'] ?? "",
      strDrink: map['strDrink'] ?? "",
      strIBA: map['strIBA'] ?? "",
      strDrinkThumb: map['strDrinkThumb'] ?? "",
      strImageSource: map['strImageSource'] != null && map['strImageSource'] != "" ? map['strDrinkThumb'] : "",
      dateModified: map['dateModified'] ?? "",
    );
  }

  static Drink toDrink(DrinkDto drink) {
    return Drink(
      id: drink.idDrink,
      name: drink.strDrink,
      description: drink.strIBA,
      urlThumbnail: drink.strDrinkThumb,
      urlImage: drink.strImageSource,
      modifiedAt: drink.dateModified,
    );
  }

  static Drink fromEntity(DrinkEntity drink) {
    return Drink(
      id: drink.id,
      name: drink.name,
      description: drink.description,
      urlThumbnail: drink.urlThumbnail,
      urlImage: drink.urlImage,
      modifiedAt: drink.modifiedAt,
    );
  }

  static DrinkEntity toEntity(Drink drink) {
    return DrinkEntity(
      id: drink.id,
      name: drink.name,
      description: drink.description,
      urlThumbnail: drink.urlThumbnail,
      urlImage: drink.urlImage,
      modifiedAt: drink.modifiedAt,
    );
  }

}