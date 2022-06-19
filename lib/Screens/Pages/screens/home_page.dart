import 'package:al_quran/Screens/Pages/screens/doctor_details_page.dart';
import 'package:al_quran/Screens/Pages/utils/user_preferences.dart';
import 'package:al_quran/Screens/Pages/data/data.dart';
import 'package:al_quran/Screens/Pages/models/models.dart';
import 'package:al_quran/Screens/Pages/widgets/widgets.dart';
import 'package:al_quran/Screens/Pages/widgets/profile_widget2.dart';
import 'package:flutter/material.dart';


import 'package:al_quran/Screens/Login/components/body.dart';
import 'package:flutter/cupertino.dart';


import 'package:al_quran/Screens/Pages/widgets/appbar_widget.dart';
import 'package:al_quran/Screens/Pages/widgets/button_widget.dart';
import 'package:al_quran/Screens/Pages/widgets/numbers_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF992DA8),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF992DA8),
        foregroundColor: Colors.white,
    title: Text(
    'Class',),
        centerTitle: false,
        automaticallyImplyLeading: false,

        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 5),
              child:  ProfileWidget(
                imagePath: user.imagePath,

              ),
              height: 4,
              width: 50,





          ),
          ),],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Hi, Abdullah",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "Welcome to Class",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25, left: 20, right: 20),
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        maxLines: 1,
                        autofocus: false,
                        style: TextStyle(color: Color(0xFF992DA8), fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search..',
                        ),
                        cursorColor: Color(0xFF992DA8),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF992DA8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF992DA8),
                          fontSize: 19,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories("assets/tooth.png", "Tasmik", "10 Lecturers"),
                  demoCategories("assets/brain.png", "Tahriri", "15 Lecturers"),
                  demoCategories("assets/heart.png", "Tarannum", "7 Lecturers"),
                  demoCategories("assets/bone.png", "Makhraj", "24 Lecturers"),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF992DA8),
                          fontSize: 19,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "assets/dr_1.jfif",
                      "Ust Wadi Anuar",
                      "Heart surgen",
                      "4.1",
                      "",
                    ),
                    demoTopRatedDr(
                      "assets/dr_2.jfif",
                      "Ust Azhar Idrus",
                      "Bone Specialist",
                      "4.2",
                      "",
                    ),
                    demoTopRatedDr(
                      "assets/dr_3.jfif",
                      "Ust Ebit Liew",
                      "Eyes Specialist",
                      "4.4",
                      "",
                    ),
                    demoTopRatedDr("assets/dr_4.jfif", "Ust Wadi Anuar",
                        "Heart surgen", "4.3", ""),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xFF992DA8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xffd9fffa).withOpacity(0.07),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              drCount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoTopRatedDr(String img, String name, String speciality,
      String rating, String distance) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetailPage()));
      },
      child: Container(
        height: 90,
        // width: size.width,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(img),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Color(0xffababab),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Rating: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
