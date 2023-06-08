import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/Widgets/atoms/input.dart';

class MoleculeSearchBar extends StatefulWidget {
  const MoleculeSearchBar(
      {super.key, required this.hasIcon, this.onIconClick});

  final Function()? onIconClick;

  final bool hasIcon;

  @override
  State<MoleculeSearchBar> createState() => _MoleculeSearchBarState();
}

class _MoleculeSearchBarState extends State<MoleculeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Input(
            onValueChanged: (v) {},
            suffixIcon: const Icon(Icons.search, color: ConstantColors.secondary,),
            textAlignVertical: TextAlignVertical.top,
            width: MediaQuery.of(context).size.width - 60,
          ),
          widget.hasIcon
              ? GestureDetector(
                  onTap: widget.onIconClick,
                  child: const Icon(
                    Icons.message,
                    size: 30,
                    color: ConstantColors.white,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
