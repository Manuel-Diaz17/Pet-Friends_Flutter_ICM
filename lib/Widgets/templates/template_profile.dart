import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';

class TemplateProfile extends StatelessWidget {
  const TemplateProfile({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }
}
