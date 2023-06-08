import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_message_block.dart';

class OrganismMessages extends StatefulWidget {
  const OrganismMessages({super.key});

  @override
  State<OrganismMessages> createState() => _OrganismMessagesState();
}

class _OrganismMessagesState extends State<OrganismMessages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _messageBlocks,
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, ConstantRoutes.petSitters),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const  [
              Icon(Icons.add, color: ConstantColors.primary,),
              Text('Find more sitters', style: TextStyle(color: ConstantColors.primary, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ],
    );
  }


  Widget get _messageBlocks{
    return Column(children: const [
      MoleculeMessageBlock(profileImage: "assets/images/daniel.jpeg", name: "Daniel Bueno", lastMessageDate: "10/05/2023",),
        MoleculeMessageBlock(profileImage: "assets/images/andre.jpeg", name: "André Silva", lastMessageDate: "10/05/2023",),
        MoleculeMessageBlock(profileImage: "assets/images/leonardo.jpeg", name: "Leonardo Freitas", lastMessageDate: "10/05/2023",),
        MoleculeMessageBlock(profileImage: "assets/images/luis.jpeg", name: "Luís Oliveira", lastMessageDate: "10/05/2023",),
    ],);
  }
}