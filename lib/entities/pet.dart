import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
part 'pet.g.dart';

@collection
class Pet {
  Id id = Isar.autoIncrement;
  late String name;
  late String species;
  late int age;
  late String gender;
  late String conditions;

  @Backlink(to: "pet")
  final petsitter = IsarLink<Petsitter>();
}
