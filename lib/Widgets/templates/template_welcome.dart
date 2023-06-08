import 'package:flutter/material.dart';

class TemplateWelcome extends StatelessWidget {
  const TemplateWelcome({super.key, required this.body});

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
