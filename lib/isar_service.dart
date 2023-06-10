import 'package:isar/isar.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> savePet(Pet newPet) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.pets.putSync(newPet));
  }

  Future<Id> savePetsitter(Petsitter newPetsitter) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.petsitters.putSync(newPetsitter));
    return newPetsitter.id;
  }

  Future<Petsitter?> getPetsitterById(Id id) async {
    final isar = await db;
    final petsitter = isar.petsitters.filter().idEqualTo(id).findFirst();
    return petsitter;
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [PetSchema, PetsitterSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
