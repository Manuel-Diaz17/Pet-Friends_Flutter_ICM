import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_home.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateSearchPages(
      body: OrganismHome(),
      hasIcon: true,
    );
  }
}
