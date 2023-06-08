import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_message.dart';
import 'package:pet_sitting_project/widgets/templates/template_message.dart';

class PageMessage extends StatelessWidget {
  const PageMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final title = args is String ? args : '';

    return TemplateMessage(
      body: const OrganismMessage(),
      title: title,
    );
  }
}
