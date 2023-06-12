import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_settings.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_sign_up.dart';
import 'package:pet_sitting_project/widgets/templates/template_authentication.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateAuthentication(
        title: 'Settings', body: OrganismSettings());
  }
}
