import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class containercolumn extends StatelessWidget {
  containercolumn(@required this.iconstyle, this.lable);
  final IconData iconstyle;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconstyle,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '$lable',
          style: TextStyle(color: Color(0xff8d8e98), fontSize: 14),
        )
      ],
    );
  }
}
