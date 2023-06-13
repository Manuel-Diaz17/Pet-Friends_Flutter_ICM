import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
part 'image_entity.g.dart';

@collection
class ImageEntity {
  Id id = Isar.autoIncrement;
  late List<byte> imagebytes;

  @Backlink(to: "images")
  final petsitter = IsarLink<Petsitter>();

  @Backlink(to: "image")
  final pet = IsarLink<Pet>();
}
