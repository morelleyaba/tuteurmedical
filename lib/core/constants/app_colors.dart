import 'package:flutter/material.dart';

class AppColors {
// (0xFF7360f2)  #7360f2
  static final Map<int, Color> _indigo = {
    50: const Color.fromRGBO(115, 96, 242, .1),
    100: const Color.fromRGBO(115, 96, 242, .2),
    200: const Color.fromRGBO(115, 96, 242, .3),
    300: const Color.fromRGBO(115, 96, 242, .4),
    400: const Color.fromRGBO(115, 96, 242, .5),
    500: const Color.fromRGBO(115, 96, 242, .6),
    600: const Color.fromRGBO(115, 96, 242, .7),
    700: const Color.fromRGBO(115, 96, 242, .8),
    800: const Color.fromRGBO(115, 96, 242, .9),
    900: const Color.fromRGBO(115, 96, 242, 1),
  };
// (0xFF25d366)  #25d366
  static final Map<int, Color> _green = {
    50: const Color.fromRGBO(37, 211, 102, .1),
    100: const Color.fromRGBO(37, 211, 102, .2),
    200: const Color.fromRGBO(37, 211, 102, .3),
    300: const Color.fromRGBO(37, 211, 102, .4),
    400: const Color.fromRGBO(37, 211, 102, .5),
    500: const Color.fromRGBO(37, 211, 102, .6),
    600: const Color.fromRGBO(37, 211, 102, .7),
    700: const Color.fromRGBO(37, 211, 102, .8),
    800: const Color.fromRGBO(37, 211, 102, .9),
    900: const Color.fromRGBO(37, 211, 102, 1),
  };



  static MaterialColor primayColor = MaterialColor(0xFF7360f2, _indigo);
  static MaterialColor secondaryColor = MaterialColor(0xFF25d366, _green);

}

