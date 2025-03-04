import 'package:flutter/material.dart';
import 'package:movie_app/Feautres/HomeScreen/views/AutoScroller.dart';
import 'package:movie_app/Feautres/HomeScreen/views/TopFilms.dart';
import 'package:movie_app/Feautres/HomeScreen/views/appbar.dart';
import 'package:movie_app/Feautres/HomeScreen/views/customcategory.dart';
import 'package:movie_app/Feautres/HomeScreen/views/customscrollcategory.dart';

import '../../../resources/TextStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Autoscroller(),
            SizedBox(
              height: 20,
            ),
            Customscrollcategory(),
            SizedBox(
              height: 20,
            ),
            Text("Top Films🔥 ", style: TextStyles.bodyTitle),
            Topfilms(),
          ],
        ),
      ),
    );
  }
}
