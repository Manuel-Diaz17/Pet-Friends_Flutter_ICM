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
  }

  Petsitter? get initialState => _currentSitter;
}
