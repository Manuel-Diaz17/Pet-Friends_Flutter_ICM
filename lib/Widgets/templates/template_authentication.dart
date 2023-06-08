import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';

class TemplateAuthentication extends StatelessWidget {
  const TemplateAuthentication(
      {super.key, required this.title, required this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: ConstantColors.primary,
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
