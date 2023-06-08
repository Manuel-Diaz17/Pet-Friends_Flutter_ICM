import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

abstract class CartEvent {}

class AddProduct extends CartEvent {
  String name;

  AddProduct(this.name);
}

class DoubleLast extends CartEvent {}

class RemoveLast extends CartEvent {
  String name;

  RemoveLast(this.name);
}

// import 'package:logging/logging.dart';

// https://pub.dev/packages/flutter_bloc

class CartBloc extends Bloc<CartEvent, List<String>> {
  @override
  final log = Logger();

  List<String> _currentCart = [];

// jfernan 2023 05 08
  CartBloc() : super([]) {
    on<AddProduct>((event, emit) {
      print("add product");
      addProduct(event.name);
      this.state.add(event.name);
      emit(this.state);
    });
    on<DoubleLast>((event, emit) {
      print("double last");
      this.state.add(this.state.last);
      emit(this.state);
    });
    on<RemoveLast>((event, emit) {
      print("remove last");
      this.state.remove(event.name);
      emit(this.state);
    });
  }

// note: state is predefined in Bloc and is NEVER explicitly change by us, we only provide a "transformation"

  //List<String> get initialState => products;

  List<String> get initialState => _currentCart;

  void addProduct(String un) {
    this.state.add(un);
  }

  void removeLast() {
    _currentCart.removeLast();
    this.state.removeLast();
  }
}
