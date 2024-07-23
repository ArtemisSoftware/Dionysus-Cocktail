import 'package:dionysus_cocktail/data/database/entities/drink_entity.dart';
import 'package:dionysus_cocktail/data/network/dto/drink_dto.dart';

import '../../domain/models/drink.dart';

class DrinkMapper {

  static DrinkDto fromJson(Map < String, dynamic > map) {
    var image =  "";

    if(map['strImageSource'] != null && map['strImageSource'] != "") {
      image = map['strImageSource'];
    } else {
      image =  map['strDrinkThumb'];
    }

    return DrinkDto(
      idDrink: map['idDrink'] ?? "",
      strDrink: map['strDrink'] ?? "",
      strIBA: map['strIBA'] ?? "",
      strDrinkThumb: map['strDrinkThumb'] ?? "",
      strImageSource: image,
      dateModified: map['dateModified'] ?? "",
      strInstructions: map['strInstructions'] ?? "",
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
      instruction: drink.strInstructions,
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
      instruction: drink.instruction,
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
      instruction: drink.instruction,
    );
  }

}