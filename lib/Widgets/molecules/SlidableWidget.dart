import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/isar_service.dart';

class SlidableWidget extends StatelessWidget {
   SlidableWidget({
    super.key,
    required this.molecule,
    required this.pet,
    //required this.onDelete,
  });

  final Widget molecule;
  //final void Function(BuildContext) onPressed;
  final Pet pet;
  //final void function(Pet) onDelete;

  final service = IsarService();  

  @override
  Widget build(BuildContext context) {
    return Slidable(
      useTextDirection: false,
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(pet.id),
      // The start action pane is the one at the left or the top side.
      endActionPane: ActionPane(
        extentRatio: 0.2,
        // A motion is a widget used to control how the pane animates.
        motion: ScrollMotion(),
        //dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            spacing: 0,
            padding: EdgeInsets.symmetric(horizontal: 5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onPressed: (BuildContext context) =>
                Navigator.pushNamed(context, ConstantRoutes.message),
            backgroundColor: Color.fromARGB(255, 235, 235, 235),
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            icon: Icons.message,
            label: 'Message',
          ),
        ],
      ),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(onDismissed: () {service.deletePet(pet.id);}),
        extentRatio: 0.2,
        // A motion is a widget used to control how the pane animates.
        motion: ScrollMotion(),
        //dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            spacing: 0,
            padding: EdgeInsets.symmetric(horizontal: 5),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: molecule,
    );
  }
}
