import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/image_entity.dart';
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
  final images = IsarLinks<ImageEntity>();

  @override
  @ignore
  String toString() {
    return 'Petsitter(id: $id, username: $username, pass: $pass, '
        'fname: $fname, lname: $lname, birthDate: $birthDate, '
        'cc: $cc, description: $description, rating: $rating, '
        'pet: $pet)';
  }
}
