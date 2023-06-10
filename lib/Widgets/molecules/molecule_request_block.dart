import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';


class MoleculeRequestBlock extends StatelessWidget {
  const MoleculeRequestBlock(
      {super.key,
      required this.name,
      required this.age,
      required this.time,
      required this.image});

  final String name;
  final String age;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ConstantColors.gray)),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      age,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      " years old",
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "I need you for ",
                    ),
                    Text(
                      time,
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ]),
        ],
      ),
    );
  }
}