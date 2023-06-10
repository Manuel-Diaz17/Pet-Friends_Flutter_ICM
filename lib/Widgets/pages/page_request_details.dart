import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_request_details.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';

class PageRequestDetails extends StatelessWidget {
  const PageRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrganismRequestsDetails()),
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: ConstantColors.primary,
      ),
    );
  }
}