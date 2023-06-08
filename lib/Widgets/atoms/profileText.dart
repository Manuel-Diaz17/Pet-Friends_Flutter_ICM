import 'package:flutter/material.dart';

class profileText extends StatelessWidget {
  const profileText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 200, // Set the desired width for the ConstrainedOverflowBox
        height: 100, // Set the desired height for the ConstrainedOverflowBox
        child: OverflowBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
