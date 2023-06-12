import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        color: Color.fromARGB(255, 235, 235, 235),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 100,
          child: ListTile(
            leading: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$age, years old",
                  style: TextStyle(fontSize: 14),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Row(
                      children: [
                        const Text(
                          "I need you for ",
                        ),
                        Text('$time hour',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () =>
                Navigator.pushNamed(context, ConstantRoutes.requestDetails),
          ),
        ),
      ),
    );
  }
}
