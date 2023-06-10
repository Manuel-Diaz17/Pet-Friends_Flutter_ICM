import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/pet.dart';
part 'petsitter.g.dart';

@collection
class Petsitter {
  Id id = Isar.autoIncrement;
  late String username;
  late String pass;
  late String fname;
  late String lname;
  late DateTime birthDate;
  late String cc;
  String? description;
  int? rating;
  final pet = IsarLinks<Pet>();
}
