import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Feautres/splash_screen.dart';

class Movieapp extends StatelessWidget {
  const Movieapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
            theme: Theme.of(context).copyWith(
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen()));
  }
}
