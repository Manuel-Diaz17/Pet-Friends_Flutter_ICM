import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';
import '../../Constants/constants_colors.dart';
import '../organisms/organism_petsitter_profile.dart';

class PagePetSitterProfile extends StatelessWidget {
  const PagePetSitterProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrganismPetSitterProfile()),
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: ConstantColors.primary,
      ),
    );
  }
}
