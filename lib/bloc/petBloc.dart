import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
import 'package:pet_sitting_project/isar_service.dart';

abstract class UserEvent {}

class ChangePet extends UserEvent {
  Id currentPet;

  ChangePet(this.currentPet);
}

class PetBloc extends Bloc<UserEvent, Pet> {
  final log = Logger();
  late Pet _currentPet;

  PetBloc() : super(Pet()) {
    on<ChangePet>((event, emit) async {
      log.i("Change pet");
      final service = IsarService();
      Pet? newPet = await service.getPetById(event.currentPet);
      log.i(newPet.toString());
      _currentPet = newPet!;
      emit(_currentPet);
    });
  }

  Pet get initialState => _currentPet;
}
