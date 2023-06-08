import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_profile.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateSearchPages(
      body: OrganismProfile(),
      hasIcon: false,
    );
  }
}
