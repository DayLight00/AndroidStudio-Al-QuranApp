import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OnBoardingCard extends StatelessWidget {
  final pages = [
    PageModel(
        color: Colors.grey[700],
        imageAssetPath: 'assets/grad_logo.png',
        title: "The Qur'an Monitoring App",
        body:
            "\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff106791),
        imageAssetPath: 'assets/theme.PNG',
        title: "Fancy & Beautiful Design",
        body:
            "We have worked hard to choose beautiful Colors, Animations and overall an appealing Design for this Beautiful Book",
        doAnimateImage: true),

    PageModel(
        color: const Color(0xff04364f),
        imageAssetPath: 'assets/jusurah.PNG',
        title: "Easy to Explore",
        body:
            "Open Surah or Juzz directly. Easy to find and read",
        doAnimateImage: true),
    PageModel(
        color: Colors.grey[850],
        imageAssetPath: 'assets/ezgif.com-gif-maker.gif',
        title: "3D Animated Drawer",
        body:
            "We have introduced a unique 3D Animated drawer. Share your feedback about such ideas.",
        doAnimateImage: true),
  ];

  OnBoardingCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.pushNamed(context, '/homeScreen');
        },
        finishCallback: () {
          Navigator.pushNamed(context, '/homeScreen');
        },
      ),
    );
  }
}
