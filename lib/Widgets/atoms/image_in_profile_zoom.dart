import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';

class ImageZoom extends StatelessWidget {
  const ImageZoom({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 180, horizontal: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(vertical: 50),
        decoration: BoxDecoration(
          color: Color.fromRGBO(43, 43, 42, 0.7),
          /* border: Border.symmetric(
            vertical:
                BorderSide(width: 15, color: Color.fromRGBO(43, 43, 42, 0.7)),
          ), */
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
