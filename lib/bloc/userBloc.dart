import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
import 'package:pet_sitting_project/isar_service.dart';

abstract class UserEvent {}

class ChangeUser extends UserEvent {
  Id currentUser;

  ChangeUser(this.currentUser);
}

class UpdateUser extends UserEvent {
  Petsitter newinfo;
  int id;

  UpdateUser(this.newinfo, this.id);
}

class UserBloc extends Bloc<UserEvent, Petsitter> {
  final log = Logger();
  late Petsitter _currentSitter;

  UserBloc() : super(Petsitter()) {
    on<ChangeUser>((event, emit) async {
      log.i("Change user");
      final service = IsarService();
      Petsitter? newSitter = await service.getPetsitterById(event.currentUser);
      log.i(newSitter.toString());
      _currentSitter = newSitter!;
      emit(_currentSitter);
    });
    on<UpdateUser>((event, emit) async {
      final service = IsarService();
      log.i("updated user");

      Petsitter? updated =
          await service.updatePetsitter(event.newinfo, event.id);
      if (updated != null) {
        _currentSitter = updated;
        log.i("updated: $updated");
        log.i("current: $_currentSitter");
        emit(_currentSitter);
      } else {
        // Handle the case when the update operation fails
        log.i("Update failed");
      }
    });
  }

  Petsitter? get initialState => _currentSitter;
}
