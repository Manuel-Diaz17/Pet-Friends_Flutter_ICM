import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_requests.dart';
import 'package:pet_sitting_project/Widgets/templates/template_authentication.dart';
import 'package:pet_sitting_project/Widgets/templates/template_search_pages.dart';

class PageRequests extends StatelessWidget {
  const PageRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateAuthentication(
      body: OrganismRequests(),
      title: 'My requests',
    );
  }
}
