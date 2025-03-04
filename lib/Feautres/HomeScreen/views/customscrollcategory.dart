import 'package:flutter/material.dart';
import 'package:movie_app/Feautres/HomeScreen/views/customcategory.dart';

class Customscrollcategory extends StatefulWidget {
  const Customscrollcategory({super.key});

  @override
  State<Customscrollcategory> createState() => _CustomscrollcategoryState();
}

List<Customcategory> categories = [
  Customcategory(
    category: "Comedy",
    onpressed: () {},
    primarycolor: const Color.fromARGB(255, 161, 50, 44),
    containercolor: const Color.fromARGB(255, 56, 7, 7),
  ),
  Customcategory(
    category: "Crime",
    onpressed: () {},
    primarycolor: Colors.green,
    containercolor: const Color.fromARGB(255, 5, 67, 7),
  ),
  Customcategory(
    category: "Romance",
    onpressed: () {},
    primarycolor: Colors.blue,
    containercolor: const Color.fromARGB(255, 7, 7, 67),
  ),
  Customcategory(
    category: "Animation",
    onpressed: () {},
    primarycolor: const Color.fromARGB(255, 156, 143, 21),
    containercolor: const Color.fromARGB(255, 67, 67, 7),
  ),
  Customcategory(
      category: "Drama",
      onpressed: () {},
      primarycolor: Colors.purple,
      containercolor: const Color.fromARGB(255, 60, 5, 69)),
];

class _CustomscrollcategoryState extends State<Customscrollcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categories[index];
        },
      ),
    );
  }
}
