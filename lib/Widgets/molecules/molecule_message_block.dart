import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';


class MoleculeMessageBlock extends StatelessWidget {
  const MoleculeMessageBlock({super.key, required this.profileImage, required this.name, required this.lastMessageDate});

  final String profileImage;
  final String name;
  final String lastMessageDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, ConstantRoutes.message, arguments:name),
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        decoration: const BoxDecoration(
          border: Border(bottom:BorderSide(color: ConstantColors.gray))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ConstantColors.white,
                borderRadius:  const BorderRadius.all(Radius.circular(50),),
                image: DecorationImage(image: AssetImage(profileImage)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                      Text(name,
                       style:const  TextStyle(
                              fontWeight: FontWeight.bold
    
                      ),),
                      Text(lastMessageDate, style: const TextStyle(fontStyle: FontStyle.italic,),),
              ],
            ),
            ],),
          const Icon(Icons.arrow_right, size: 40,color: ConstantColors.gray,) ,
         
            
          ],
        ),
      ),
    );
  }
}