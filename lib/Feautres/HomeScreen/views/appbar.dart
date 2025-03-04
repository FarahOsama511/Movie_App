import 'package:flutter/material.dart';

import '../../../resources/TextStyles.dart';
import '../../SearchScreen/SearchScreen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        centerTitle: true,
        title: Text(
          "The Film",
          style: TextStyles.appBarTitle,
        ),
        leading: Icon(
          Icons.movie_creation_outlined,
          size: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchScreen();
              }));
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
