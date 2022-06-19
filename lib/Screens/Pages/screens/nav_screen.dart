import 'package:flutter/material.dart';
import 'package:al_quran/Screens/Pages/data/data.dart';
import 'package:al_quran/Screens/Pages/screens/screens.dart';
import 'package:al_quran/Screens/Pages/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:al_quran/Screens/Pages/screens/home_page.dart';
import 'package:al_quran/Screens/Pages/page/profile_page.dart';
import 'package:flutter/widgets.dart';

import '../../chats/chats_screen.dart';


class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomePage(),

    ChatsScreen(),
    ProfilePage(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,

    Icons.chat,
    Icons.menu,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                   onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.purple,
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
