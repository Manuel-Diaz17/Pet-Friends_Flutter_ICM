import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_profile.dart';
import 'package:pet_sitting_project/Widgets/templates/template_profile.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';
import 'package:pet_sitting_project/Widgets/templates/template_welcome.dart';
import 'package:pet_sitting_project/widgets/templates/template_platform.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateProfile(
      body: OrganismProfile(),
    );
  }
}
