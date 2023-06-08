import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_pet_sitter_block.dart';

class OrganismPetSitter extends StatelessWidget {
  const OrganismPetSitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _petSitterList(context),
    );
  }

  _petSitterList(BuildContext context) {
    return [
      GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, ConstantRoutes.petSitterProfile),
        child: const MoleculePetSitterBlock(
          name: "Joshua Turner",
          age: "42",
          likes: "4.5",
          image: "assets/images/homem3.jpg",
        ),
      ),
      const MoleculePetSitterBlock(
        name: "Matthew Lewis",
        age: "37",
        likes: "3.4",
        image: "assets/images/homem4.jpg",
      ),
      const MoleculePetSitterBlock(
        name: "William Taylor",
        age: "22",
        likes: "4.0",
        image: "assets/images/homem6.jpg",
      ),
    ];
  }
}
