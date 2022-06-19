import 'package:al_quran/Screens/Login/components/body.dart';
import 'package:al_quran/Screens/Welcom/welcome_screen.dart';
import 'package:al_quran/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:al_quran/Screens/Pages/models/user.dart';
import 'package:al_quran/Screens/Pages/utils/user_preferences.dart';
import 'package:al_quran/Screens/Pages/widgets/appbar_widget.dart';
import 'package:al_quran/Screens/Pages/widgets/button_widget.dart';
import 'package:al_quran/Screens/Pages/widgets/numbers_widget.dart';
import 'package:al_quran/Screens/Pages/widgets/profile_widget.dart';
import 'package:flutter/widgets.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 24),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.purpleAccent),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(

        text: 'Logout',

        onClicked: () {Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
