import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../dark_mode_controller/theme_provider.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;
  final themeChange = Provider.of<DarkThemeProvider>(context);

  return AppBar(
    automaticallyImplyLeading: false,
    title: Text("Profile"),
    foregroundColor: Colors.white,

    backgroundColor:Colors.purple,


    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}
