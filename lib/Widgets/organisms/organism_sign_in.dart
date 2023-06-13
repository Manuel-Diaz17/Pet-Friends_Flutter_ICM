import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_sitting_project/bloc/userBloc.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/constants/constant_user_info.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/isar_service.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';
import 'package:pet_sitting_project/widgets/atoms/input.dart';

class OrganismSignIn extends StatefulWidget {
  const OrganismSignIn({super.key});

  @override
  State<OrganismSignIn> createState() => _OrganismSignInState();
}

class _OrganismSignInState extends State<OrganismSignIn> {
  final _space = const SizedBox(
    height: 30,
  );
  final service = IsarService();
  String _userName = '';
  String _password = '';
  String _feedbackMessage = '';

  void _changeUser(int id) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    setState(() => bloc.add(ChangeUser(id)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            _space,
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo_petfriends.png"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            _space,
            _inputs,
            const SizedBox(
              height: 10,
            ),
            _logInButton,
          ],
        ));
  }

  Widget get _inputs {
    return Wrap(
      runSpacing: 15,
      children: [
        Input(
          hintText: 'Username',
          keyboardType: TextInputType.name,
          onValueChanged: (value) => setState(() => _userName = value),
        ),
        Input(
          hintText: 'Password',
          obscureText: true,
          onValueChanged: (value) => setState(() => _password = value),
        ),
        Text(
          _feedbackMessage,
          style: TextStyle(
            color: Colors
                .red, // Choose your desired color for the feedback message
          ),
        )
      ],
    );
  }

  Widget get _logInButton {
    return Container(
      alignment: Alignment.bottomRight,
      child: Button(
        label: 'Log In',
        width: 80,
        height: 40,
        fontSize: 16,
        onTap: _logIn,
      ),
    );
  }

  _logIn() async {
    if (_userName.isEmpty) {
      setState(() => _feedbackMessage = 'Please insert your username');
    } else if (_password.isEmpty) {
      setState(() => _feedbackMessage = 'Please insert your password');
    } else {
      int id = await service.getlogin(_userName, _password);
      if (id != 0) {
        _changeUser(id);
        Navigator.pushNamed(context, ConstantRoutes.logged);
      } else {
        setState(() => _feedbackMessage = 'Incorrect username or password');
      }
    }
  }
}
