import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_sign_up.dart';
import 'package:pet_sitting_project/widgets/templates/template_authentication.dart';

class PageSignUp extends StatelessWidget {
  const PageSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateAuthentication(title: '', body: OrganismSignUp());
  }
}
