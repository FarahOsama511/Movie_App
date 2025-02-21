import 'package:flutter/material.dart';
import 'package:movie_app/Feautres/HomeScreen/views/AutoScroller.dart';
import 'package:movie_app/Feautres/HomeScreen/views/appbar.dart';

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
      body: Autoscroller(),
    );
  }
}
