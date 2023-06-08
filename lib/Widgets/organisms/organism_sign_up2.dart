import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';
import 'package:pet_sitting_project/widgets/atoms/input.dart';

class OrganismSignUp2 extends StatefulWidget {
  const OrganismSignUp2({super.key});

  @override
  State<OrganismSignUp2> createState() => _OrganismSignUp2State();
}

class _OrganismSignUp2State extends State<OrganismSignUp2> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
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
      ]),
    );
  }

  //Widgets
  Widget get _form {
    return Wrap(
      runSpacing: 10,
      children: [
        _nameAndSpecie,
        _petInfo,
        _questionSection,
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
          onValueChanged: (s) {},
          hintText: 'Name',
          keyboardType: TextInputType.name,
        ),
        Input(
          onValueChanged: (s) {},
          hintText: 'Specie',
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }

  Widget get _petInfo {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Input(
                onValueChanged: (s) {},
                hintText: 'Age',
                keyboardType: TextInputType.name,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Input(
                onValueChanged: (s) {},
                hintText: 'Gender',
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get _questionSection {
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
  }

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
        label: 'Next',
        width: 80,
        height: 40,
        fontSize: 16,
        onTap: () {
          Navigator.pushNamed(context, ConstantRoutes.signIn);
        },
      ),
    );
  }
}
