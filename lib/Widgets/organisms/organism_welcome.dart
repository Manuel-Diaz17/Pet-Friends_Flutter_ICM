import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/Widgets/atoms/Button.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';

class OrganismWelcome extends StatefulWidget {
  const OrganismWelcome({super.key});

  @override
  State<OrganismWelcome> createState() => _OrganismWelcomeState();
}

class _OrganismWelcomeState extends State<OrganismWelcome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logo,
        const SizedBox(
          height: 100,
        ),
        _buttons(context),
      ],
    );
  }

  Widget get _logo {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }

  Widget _buttons(BuildContext context) {
    return Center(
      child: Wrap(
        runSpacing: 20,
        children: [
          Button(
            label: 'Log In',
            onTap: () => Navigator.pushNamed(context, ConstantRoutes.signIn),
          ),
          Button(
            label: 'Sign Up',
            onTap: () => Navigator.pushNamed(context, ConstantRoutes.signUp),
            color: ConstantColors.gray,
          ),
        ],
      ),
    );
  }
}
