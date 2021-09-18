import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaroselSlider extends StatefulWidget {
  const CaroselSlider({Key key}) : super(key: key);

  @override
  _CaroselSliderState createState() => _CaroselSliderState();
}

class _CaroselSliderState extends State<CaroselSlider> {
  int currentPos = 0;
  List<String> listPaths = [
    'assets/images/Grilled-Chicken.png',
    'assets/images/Bread-Slices.png',
    'assets/images/Food-Plate.png',
    'assets/images/Egg1.png',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: listPaths.length,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }
                  ),
                  itemBuilder: (context,index,p){
                    return MyImageView(listPaths[index]);
                  },
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listPaths.map((url) {
                    int index = listPaths.indexOf(url);
                    return Container(
                      width: MediaQuery.of(context).size.width*0.15,
                      height: 4.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: currentPos == index
                            ? Colors.black:Colors.grey.shade400,
                      ),
                    );
                  }).toList(),
                ),
              ]
          )
      ),
    );
  }

}


class MyImageView extends StatelessWidget{
  // Default Background Color.
  Color colorCode = Colors.lightBlue;

  final Random random = Random();

  generateRandomColor(){

    Color tmpColor = Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    ) ;
    return tmpColor;

  }

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end:
            Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: <Color>[
             generateRandomColor(),
              generateRandomColor()
            ], // red to yellow
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(imgPath),
          ),
        )
    );
  }

}