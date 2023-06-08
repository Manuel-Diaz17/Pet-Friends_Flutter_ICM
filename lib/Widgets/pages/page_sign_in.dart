import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_sign_in.dart';
import 'package:pet_sitting_project/widgets/templates/template_authentication.dart';

class PageSignIn extends StatelessWidget {
  const PageSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateAuthentication(
      title: 'Log In',
      body: OrganismSignIn(),
    );
  }
}
