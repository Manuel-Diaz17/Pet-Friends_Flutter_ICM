import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_track_route.dart';

import '../../constants/constants_colors.dart';

class PageTrackRoute extends StatelessWidget {
  const PageTrackRoute({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrganismTrackRoute()),
    );
  }
}

