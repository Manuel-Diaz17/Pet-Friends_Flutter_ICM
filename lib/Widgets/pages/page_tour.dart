import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_tour.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';

class PageTour extends StatelessWidget {
  const PageTour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrganismTour()),
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: ConstantColors.primary,
      ),
    );
  }
}