
import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';

class MoleculeStoreItem extends StatelessWidget {
  const MoleculeStoreItem({super.key, required this.title, required this.description, required this.image, required this.price, this.boxFit, this.hasTopDivider=false});

  final String title;
  final String description;
  final String price;
  final String image;
  final BoxFit? boxFit;
  final bool hasTopDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:const EdgeInsets.symmetric( horizontal: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ConstantColors.gray,), top: hasTopDivider?BorderSide(color: ConstantColors.gray,):BorderSide.none),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.vertical,
            spacing: 25,
            children: [
              _description,
              _button
            ]
          ,
          ),
          const SizedBox(width: 20,),
         _itemImage,
        ],
      ),
    );
  }

  Widget get _itemImage{
    return Container(
            height: 150,
            width: 90,
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: boxFit?? BoxFit.cover,
              ),
            ) ,
          );
  }

  Widget get _description{
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ConstantColors.primary),),
              Text(description),
            ],
    );
  }
  Widget get _button{
    return Button(
            label: "€$price", 
            width: 75,
            height: 31,
            fontSize: 16,
            onTap:(){},
    );
  }
}