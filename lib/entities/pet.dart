import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/image_entity.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
part 'pet.g.dart';

@collection
class Pet {
  Id id = Isar.autoIncrement;
  late String name;
  late String species;
  late int age;
  late String gender;
  String? conditions;
  late int? time;
  String? location;
  String? serviceCode;
  int? tourTime;
  String? owner;
  final image = IsarLink<ImageEntity>();

  @Backlink(to: "pet")
  final petsitter = IsarLink<Petsitter>();
}
