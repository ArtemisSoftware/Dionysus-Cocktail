import 'package:equatable/equatable.dart';

class Drink extends Equatable{
  final int id;
  final String name;
  final String description;
  final String urlThumbnail;
  final String urlImage;
  final String modifiedAt;
  // final String ? title;

  const Drink({
    required this.id,
    required this.name,
    required this.description,
    required this.urlThumbnail,
    required this.urlImage,
    required this.modifiedAt,
  });

  @override
  List < Object ? > get props {
    return [
      id,
      name,
      description,
      urlThumbnail,
      urlImage,
      modifiedAt,
    ];
  }
}