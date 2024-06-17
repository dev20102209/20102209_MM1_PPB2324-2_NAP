import 'package:flutter/material.dart';

class TextStyleConstant {
  static TextStyle poppins24 = const TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
    fontSize: 24,
  );

  // ignore: constant_identifier_names
  static TextStyle poppins_paragraph = const TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: "Poppins",
    fontSize: 13,
    color: Color(0xff868686),
  );

  static TextStyle poppins_14_white = const TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: "Poppins",
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle poppins_medium = const TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: "Poppins",
    fontSize: 13,
    color: Color(0xff525252),
  );
}