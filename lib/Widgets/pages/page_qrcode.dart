import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_qrcode.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';

class PageQrCode extends StatelessWidget {
  const PageQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OrganismQrCode()),
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: ConstantColors.primary,
      ),
    );
  }
}