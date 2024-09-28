import 'package:flutter/material.dart';
import 'package:vocaby/features/my_list/data/artikel.dart';

class ColorsManager {
  static const Color primaryColor = Color(0xff000000);
  static const Color secondaryColor = Color(0xffDD0000);
  static const Color thirdColor = Color(0xffFFCC00);
  static const Color derColor = Color.fromARGB(255, 8, 137, 243);
  static const Color dieColor = Colors.redAccent;
  static const Color dasColor = Color.fromARGB(255, 73, 175, 76);
  static Color getArtikelColor(String value) {
    return value == artikel[0]
        ? derColor
        : value == artikel[1]
            ? dieColor
            : dasColor;
  }
}
