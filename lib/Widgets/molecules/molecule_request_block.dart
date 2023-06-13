import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/bloc/petBloc.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/isar_service.dart';

class MoleculeRequestBlock extends StatefulWidget {
  final int id;

  MoleculeRequestBlock({Key? key, required this.id}) : super(key: key);

  @override
  _MoleculeRequestBlockState createState() => _MoleculeRequestBlockState();
}

class _MoleculeRequestBlockState extends State<MoleculeRequestBlock> {
  late String name = '';
  late int age = 0;
  late int time = 0;
  String image = "assets/images/jack.jpg";
  final service = IsarService();
  final log = Logger();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    final pet = await service.getPetById(widget.id);
    // Use the pet data to initialize the widget state variables (name, age, time, image)
    log.i(pet.toString());
    setState(() {
      // Update the state variables with the retrieved data
      name = pet!.name;
      age = pet.age;
      time = pet.time!;
      //image = "assets/images/jack.jpg";
    });
  }

  void _changePet(int id) {
    PetBloc bloc = BlocProvider.of<PetBloc>(context);
    setState(() => bloc.add(ChangePet(id)));
  }

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
              title: name == ''
                  ? const CircularProgressIndicator()
                  : Text(
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
              onTap: () {
                Navigator.pushNamed(context, ConstantRoutes.requestDetails);
                _changePet(widget.id);
              }),
        ),
      ),
    );
  }
}
