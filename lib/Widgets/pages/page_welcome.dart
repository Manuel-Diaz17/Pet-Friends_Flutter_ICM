import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_welcome.dart';
import 'package:pet_sitting_project/widgets/templates/template_welcome.dart';

class PageWelcome extends StatelessWidget {
  const PageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateWelcome(body: OrganismWelcome());
  }
}
