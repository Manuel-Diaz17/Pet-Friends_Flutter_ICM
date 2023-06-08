
import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_pet_sitter_block.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_search_bar.dart';

class TemplateSearchPages extends StatefulWidget {
  const TemplateSearchPages({super.key, required this.body, required this.hasIcon});

  final bool hasIcon;

  final Widget body;
  @override
  State<TemplateSearchPages> createState() => _TemplateSearchPagesState();
}

class _TemplateSearchPagesState extends State<TemplateSearchPages> {

  bool hasMessageOption = false;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: ListView(
            children: [
              Container(
                width: double.infinity,
                color: ConstantColors.primary,
                child: MoleculeSearchBar(hasIcon: widget.hasIcon, onIconClick: _messages,),
              ),
              const SizedBox(height: 20,),
             widget.body,
            ],
          )),
         
        ],
      ),
    );
  }

  _messages(){
    Navigator.pushNamed(context, ConstantRoutes.messages);
  }

}