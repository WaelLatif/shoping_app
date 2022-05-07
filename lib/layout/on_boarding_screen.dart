// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../styles/colors.dart';
import '../styles/colors.dart';
import '../styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'OnBoard 1 Title',
        body: 'OnBoard 1 body'),
    BoardingModel(
        image: 'assets/images/onboard_2.jpg',
        title: 'OnBoard 2 Title',
        body: 'OnBoard 2 body'),
    BoardingModel(
        image: 'assets/images/onboard_3.jpg',
        title: 'OnBoard 3 Title',
        body: 'OnBoard 3 body'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.deepPurple,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    boardController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn );
                  },
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: defaultColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            model.title.toString(),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            model.body.toString(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      );
}
