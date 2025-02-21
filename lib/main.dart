import 'package:flutter/material.dart';
import 'package:movie_app/Feautres/splash_screen.dart';
import 'package:movie_app/core/service/ApiService.dart';

void main() {
  ApiService apiService = ApiService();
  apiService.getMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black, foregroundColor: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: SplashScreen());
  }
}
