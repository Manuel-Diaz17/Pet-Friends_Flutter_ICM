import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'package:pet_sitting_project/bloc/userBloc.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/entities/pet.dart';
import 'package:pet_sitting_project/isar_service.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';
import 'package:pet_sitting_project/widgets/atoms/input.dart';

class OrganismSignUp2 extends StatefulWidget {
  const OrganismSignUp2({super.key});

  @override
  State<OrganismSignUp2> createState() => _OrganismSignUp2State();
}

class _OrganismSignUp2State extends State<OrganismSignUp2> {
  String? _selectedRole;
  late String name;
  late String species;
  late int age;
  late String gender;
  String? conditions;
  late int? time;
  String? location;
  String? serviceCode;
  int? tourTime;
  String? owner;
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
        child: Wrap(
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _form,
          ],
        ),
      )
    ]);
  }

  //Widgets
  Widget get _form {
    return Wrap(
      runSpacing: 10,
      children: [
        _nameAndSpecie,
        _petInfo,
        //_questionSection,
        _additionalInfo,
        _nextButton,
      ],
    );
  }

  Widget get _nameAndSpecie {
    return Wrap(
      runSpacing: 10,
      children: [
        Input(
          onValueChanged: (s) {
            name = s;
          },
          hintText: 'Name',
          keyboardType: TextInputType.name,
        ),
        Input(
          onValueChanged: (s) {
            species = s;
          },
          hintText: 'Specie',
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  Widget get _petInfo {
    return Wrap(
      runSpacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  int? parsedAge = int.tryParse(s);
                  if (parsedAge != null) {
                    setState(() {
                      age = parsedAge;
                    });
                  }
                },
                hintText: 'Age',
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  gender = s;
                },
                hintText: 'Gender',
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  location = s;
                },
                hintText: 'Location',
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  serviceCode = s;
                },
                hintText: 'Code',
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  int? parsedAge = int.tryParse(s);
                  if (parsedAge != null) {
                    setState(() {
                      tourTime = parsedAge;
                    });
                  }
                },
                hintText: 'Tour time',
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Input(
                onValueChanged: (s) {
                  owner = s;
                },
                hintText: 'Owner',
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /*  Widget get _questionSection {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Disabilities or special conditions?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          title: const Text('Yes'),
          activeColor: ConstantColors.primary,
          value: 'pet_owner',
          groupValue: _selectedRole,
          contentPadding: const EdgeInsets.all(0),
          visualDensity: const VisualDensity(horizontal: 0),
          onChanged: (value) {
            setState(() {
              _selectedRole = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text('No'),
          activeColor: ConstantColors.primary,
          value: 'pet_sitter',
          groupValue: _selectedRole,
          contentPadding: const EdgeInsets.all(0),
          onChanged: (value) {
            setState(() {
              _selectedRole = value.toString();
            });
          },
        ),
      ],
    );
  } */

  Widget get _additionalInfo {
    return Wrap(
      runSpacing: 10,
      children: [
        const Text(
          'If yes, please describe it:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Input(
          onValueChanged: (s) {},
          hintText: '',
          keyboardType: TextInputType.name,
        ),
        const Text(
          'More relevant information',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Input(
          onValueChanged: (s) {},
          hintText: '',
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  Widget get _nextButton {
    return Container(
      alignment: Alignment.bottomRight,
      child: Button(
        label: 'Add',
        width: 80,
        height: 40,
        fontSize: 16,
        onTap: () async {
          Navigator.pushNamed(context, ConstantRoutes.logged);
          final petsitter = context.read<UserBloc>().state;
          int id = await service.savePetToSitter(
              petsitter,
              Pet()
                ..age = age
                ..gender = gender
                ..name = name
                ..time = tourTime
                ..species = species
                ..location = location
                ..serviceCode = serviceCode
                ..owner = owner
                ..conditions = conditions);
        },
      ),
    );
  }
}
