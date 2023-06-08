import 'package:flutter/material.dart';

class MoleculeAvatar extends StatelessWidget {
  const MoleculeAvatar(
      {super.key,
      required this.name,
      required this.followers,
      required this.img});

  final String name;
  final String followers;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(img),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("$followers Followers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
