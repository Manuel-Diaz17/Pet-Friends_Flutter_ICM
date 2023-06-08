import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';
import 'package:pet_sitting_project/widgets/atoms/input.dart';


class OrganismMessage extends StatefulWidget {
  const OrganismMessage({super.key});

  @override
  State<OrganismMessage> createState() => _OrganismMessageState();
}

class _OrganismMessageState extends State<OrganismMessage> {
  String _message = '';
  List<String> _messages = [];
  TextEditingController inputController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, bottom: 10),
          child:_messagesSent() ,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Input(
            onValueChanged: _writeMessage,
            width:  MediaQuery.of(context).size.width-70, 
            textAlignVertical: TextAlignVertical.top,
            borderCircular: false,
            inputController: inputController,
            ),
          Button(
            label: "Send",
            fontSize: 15,
            borderCircular: false,
            onTap: (){
            _sendMessage();
            },
            width: 70,
            height: 40, 
            color: ConstantColors.primary,
          )
        ],)
      ],
    );
  }

  _writeMessage(String m ){
    setState(() {
      _message =  m;
    });
  }
  _sendMessage(){
    setState(() {
      _messages.add(_message);
    });
    setState(() {
      _message = "";
      inputController.clear();
    });
   
  }

  _messagesSent(){
    if(_messages.isEmpty){
      return Column(children:const [],) ;
    }
    final List<Widget> messages =[];
    for (var element in _messages) { 
       messages.add( 
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          decoration: const BoxDecoration(
            color: ConstantColors.primary,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:  Radius.circular(10), bottomLeft:  Radius.circular(10) )
          ),
          child: Text(element, style: const TextStyle(color: ConstantColors.white),),
        ),
      );
    }

    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 10,
      children: messages,
    );
  }
}