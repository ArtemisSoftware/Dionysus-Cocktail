import 'package:equatable/equatable.dart';

class Drink extends Equatable{
  final String id;
  final String name;
  final String description;
  final String urlThumbnail;
  final String urlImage;
  final String modifiedAt;
  final String instruction;

  const Drink({
    required this.id,
    required this.name,
    required this.description,
    required this.urlThumbnail,
    required this.urlImage,
    required this.modifiedAt,
    required this.instruction,
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
      instruction,
    ];
  }
}