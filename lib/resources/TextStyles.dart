import 'package:flutter/material.dart';

import 'Color_Manager.dart';

class TextStyles {
  static const TextStyle appBarTitle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle category =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle bodyTitle = TextStyle(
      color: ColorManager.primaryColor,
      fontSize: 40,
      fontWeight: FontWeight.bold);
  static const TextStyle caption = TextStyle(fontSize: 12);
  static const TextStyle Textbutton = TextStyle(
    color: ColorManager.primaryColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle moviedescription =
      TextStyle(color: Color.fromARGB(255, 150, 145, 145));
  static const TextStyle movierating = TextStyle(
    color: ColorManager.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
