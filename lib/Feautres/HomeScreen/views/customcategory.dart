import 'package:flutter/material.dart';
import 'package:movie_app/resources/TextStyles.dart';

class Customcategory extends StatefulWidget {
  final String category;
  final Function() onpressed;
  Color primarycolor;
  Color containercolor;
  Customcategory(
      {required this.category,
      required this.onpressed,
      required this.primarycolor,
      required this.containercolor});

  @override
  State<Customcategory> createState() => _CustomcategoryState();
}

class _CustomcategoryState extends State<Customcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        height: 70,
        decoration: BoxDecoration(
          color: widget.containercolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.primarycolor,
            width: 5,
          ),
        ),
        child: Center(
          child: InkWell(
            onTap: widget.onpressed,
            child: Text(
              widget.category,
              style: TextStyles.category.copyWith(
                color: widget.primarycolor,
              ),
            ),
          ),
        ));
  }
}
