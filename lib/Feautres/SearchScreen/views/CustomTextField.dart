import 'package:flutter/material.dart';

import '../../../resources/Color_Manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  final Function(String) onChanged;
  final void Function() onpressed;

  CustomTextField(
      {required this.controller,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        onChanged: onChanged,
        cursorColor: ColorManager.primaryColor,
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          focusColor: ColorManager.primaryColor,
          fillColor: ColorManager.primaryColor,
          hintText: hintText,
          suffixIcon: IconButton(onPressed: onpressed, icon: Icon(icon)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorManager.primaryColor)),
        ),
      ),
    );
  }
}
