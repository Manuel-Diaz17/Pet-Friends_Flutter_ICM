import 'package:flutter/material.dart';
import 'package:pet_sitting_project/widgets/organisms/organism_messages.dart';
import 'package:pet_sitting_project/widgets/templates/template_message.dart';


class PageMessages extends StatelessWidget {
  const PageMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateMessage(body: OrganismMessages(), title: "Messages",);
  }
}