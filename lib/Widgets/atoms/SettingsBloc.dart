import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

abstract class SettingsEvent {}

class ChangeName extends SettingsEvent {
  String name;

  ChangeName(this.name);
}

class SettingsBloc extends Bloc<SettingsEvent, String> {
  final log = Logger();
  String _name = "Mark Hunt";

  SettingsBloc() : super("Scott Wilson") {
    on<ChangeName>((event, emit) {
      log.i("Change name");
      _name = event.name; // Update the name with the provided value
      emit(_name);
    });
  }

  String get initialState => _name;
}
