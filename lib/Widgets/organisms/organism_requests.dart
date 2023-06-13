import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/Widgets/molecules/SlidableWidget.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_request_block.dart';
import 'package:pet_sitting_project/bloc/userBloc.dart';

import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
import 'package:pet_sitting_project/isar_service.dart';

class OrganismRequests extends StatefulWidget {
  const OrganismRequests({super.key});

  @override
  State<OrganismRequests> createState() => _OrganismRequestsState();
}

class _OrganismRequestsState extends State<OrganismRequests> {
  Future<List<Pet>>? _petsFuture;
  final log = Logger();

  @override
  void initState() {
    super.initState();
    final petsitter = context
        .read<UserBloc>()
        .state;
    log.i(petsitter.toString());
    _petsFuture = _getPets(petsitter);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pet>>(
      future: _petsFuture, // Use the Future in FutureBuilder
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while waiting for pets data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Show error message if there was an error retrieving pets data
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // If pets data is available, build the widget using the data
          final pets = snapshot.data!;
          return _petRequestsList(pets);
        } else {
          return Container(); // Empty container if no data is available
        }
      },
    );
  }

  Future<List<Pet>> _getPets(petsitter) async {
    final service = IsarService();
    return await service.getPetsitterPets(petsitter);
  }

  Widget _petRequestsList(List<Pet> pets) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final pet = pets[index];
              return SlidableWidget(
                molecule: MoleculeRequestBlock(id: pet.id),
                pet: pet,
              );
            },
            childCount: pets.length,
          ),
        ),
      ],
    );
  }
}
