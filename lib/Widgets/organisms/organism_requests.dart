import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_request_block.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';


class OrganismRequests extends StatefulWidget {
  const OrganismRequests({super.key});

  @override
  State<OrganismRequests> createState() => _OrganismRequestsState();
}

class _OrganismRequestsState extends State<OrganismRequests> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _petRequestsList(context),
    );
  }

  _petRequestsList(BuildContext context) {
    return [
      GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, ConstantRoutes.requestDetails),
        child: const MoleculeRequestBlock(
          name: "Max",
          age: "10",
          time: "1 hour",
          image: "assets/images/puppy.jpg",
        ),
      ),
      
    ];
  }
}