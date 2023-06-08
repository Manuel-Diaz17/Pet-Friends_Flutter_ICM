import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/pet.dart';
part 'petsitter.g.dart';

@collection
class Petsitter {
  Id id = Isar.autoIncrement;
  late String fname;
  late String lname;
  late DateTime birthDate;
  late String description;
  late int rating;
  late int followers;
  final pet = IsarLinks<Pet>();
}
