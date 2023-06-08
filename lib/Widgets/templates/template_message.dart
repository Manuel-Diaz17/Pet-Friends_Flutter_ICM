import 'package:flutter/material.dart';

import '../../constants/constants_colors.dart';


class TemplateMessage extends StatelessWidget {
  const TemplateMessage({super.key, required this.body, required this.title});

  final Widget body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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