import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/screens/home/home_screen_title.dart';
import 'package:sun_basics_flutter/screens/home/home_tile.dart';

import '../../model/magazine_model.dart';

class HomeScreen extends StatelessWidget{

  HomeScreen();
  // List<String> magazineImages = ["assets/sports.jpg","assets/sports.jpg","assets/sports.jpg"];
  // List<String> magazineTitles = ["sports", "health", "test"];
  List<MagazineModel> magazines = [
    MagazineModel(title: "sports", imagePath: "assets/sports.jpg"),
    MagazineModel(title: "health", imagePath: "assets/sports.jpg"),
    MagazineModel(title: "test", imagePath: "assets/sports.jpg"),
    MagazineModel(title: "te322323123st", imagePath: "assets/sports.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeScreenTitle("magazine"),
              SizedBox(width: 6,),
              HomeScreenTitle("news")
            ],
          ),
          NotificationListener(
            child: Expanded(
              child: ListView.builder(
                itemCount: magazines.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                   HomeTile(imagePath: magazines[index].imagePath,
                      text: magazines[index].title),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
