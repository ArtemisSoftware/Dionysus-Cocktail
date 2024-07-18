import 'package:dionysus_cocktail/data/network/dto/drink_dto.dart';

class DrinkMapper {

  static DrinkDto fromJson(Map < String, dynamic > map) {
    return DrinkDto(
      idDrink: map['idDrink'] ?? "",
      strDrink: map['strDrink'] ?? "",
      strIBA: map['strIBA'] ?? "",
      strDrinkThumb: map['strDrinkThumb'] ?? "",
      strImageSource: map['strImageSource'],
      // TODO: rever isto
      //strImageSource: map['strImageSource'] != null && map['strImageSource'] != "" ? map['strImageSource'] : kDefaultImage,
      modifiedAt: map['publishedAt'] ?? "",
    );
  }

  // static UserDTO toDTO(User user) {
  //   final birthYear = DateTime.now().year - user.age;
  //   return UserDTO(
  //     id: user.id,
  //     fullName: user.name,
  //     birthYear: birthYear.toString(),
  //   );
  // }
  //
  // // Convert UserDTO to User
  // static User fromDTO(UserDTO userDTO) {
  //   final currentYear = DateTime.now().year;
  //   final age = currentYear - int.parse(userDTO.birthYear);
  //   return User(
  //     id: userDTO.id,
  //     name: userDTO.fullName,
  //     age: age,
  //   );
  // }
}