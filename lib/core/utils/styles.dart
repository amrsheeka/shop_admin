import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Styles{
  static const Color mainColor=Colors.deepPurple;
  static final Color iconsColor = Colors.deepPurple.shade100;
  static const Color subTitleColors = Colors.blueGrey;
  static const Color cardColors=Colors.white;
  static HexColor backgroundColor = HexColor("#f3f0f7");
  static EdgeInsets mainPadding =const EdgeInsets.only(top: 10,left: 20,right: 20);
  static EdgeInsets contentPadding = const EdgeInsets.all(20.0);
  static BoxDecoration mainBoxDecoration = BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          spreadRadius: .1,
          blurRadius:2,
        )
      ],
      color: Styles.cardColors,
      borderRadius: BorderRadius.circular(10)
  );
  static BoxDecoration contentDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Styles.backgroundColor)
  );
}
