import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';


class OrganismRequestsDetails extends StatefulWidget {
  const OrganismRequestsDetails({super.key});

  @override
  State<OrganismRequestsDetails> createState() => _OrganismRequestsDetailsState();
}

class _OrganismRequestsDetailsState extends State<OrganismRequestsDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            image: DecorationImage(image: AssetImage("assets/images/puppy.jpg")),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Max',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '10 years',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          'Pet Sitter: John Murphy',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 18),
        Text(
          'Service time: 1 hour',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 18),
        Text(
          'Location: Aveiro',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, ConstantRoutes.qrCode);
          },
          icon: Icon(
            Icons.flag,
            size: 15,
            ),
          label: Text('Start tour'),
          style: ElevatedButton.styleFrom(
            backgroundColor: ConstantColors.primary
          ),
        ),
      ],
      );
  }
}