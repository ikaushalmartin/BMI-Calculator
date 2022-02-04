import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class smallcontainer extends StatelessWidget {
  smallcontainer(this.colour, this.cardChild);
  final Widget cardChild;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

const textstyle = TextStyle(
  color: Color(0xff24D876),
  fontWeight: FontWeight.w500,
  fontSize: 30,
);

const centertext = TextStyle(fontWeight: FontWeight.w900, fontSize: 80);

const descstyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
);
