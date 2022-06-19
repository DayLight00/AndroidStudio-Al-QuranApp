import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              imagePath: "assets/grad_logo.png",
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            const BackBtn(),
            const CustomTitle(title: "Help Guide"),
            const Guidelines(),
            const AppVersion(),
          ],
        ),
      ),
    );
  }
}

class Guidelines extends StatelessWidget {
  const Guidelines({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, height * 0.1),
      child: ListView(
        children: const <Widget>[
          GuideContainer(
            guideNo: 1,
            title: "Internet Connectivity",
            guideDescription:
                "For now, the app is NOT available in Offline reading mode. So, internet connection is a must for getting all the data.",
          ),
          GuideContainer(
            title: "Juzz - Surah ",
            guideNo: 2,
            guideDescription:
                "Open any Surah or Juzz directly from index. It has all 30 chapters and 114 surahs. ",
          ),

          GuideContainer(
            guideNo: 3,
            title: "Introduction Tab",
            guideDescription:
                "It will re-open the introduction of app that you might have saw when opened the app for the first time",
          ),


          GuideContainer(
            guideNo: 4,
            title: "Developer's Info",
            guideDescription:
                "Name: ABDULLAH MAHYUDDIN SHAMSUL KAMAL \nEmail: mahyuddin.abdullah99@gmail.com ",
          )
        ],
      ),
    );
  }
}

class GuideContainer extends StatelessWidget {
  final String title;
  final String guideDescription;
  final int guideNo;

  const GuideContainer(
      {Key key,
      @required this.guideNo,
      @required this.title,
      @required this.guideDescription})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            "\n$guideNo. $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
        ],
      ),
    );
  }
}
