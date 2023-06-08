

import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_pet_sitters.dart';

class PagePetSitters extends StatelessWidget {
  const PagePetSitters({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateSearchPages(body: OrganismPetSitter(), hasIcon: false) ;
  }
}