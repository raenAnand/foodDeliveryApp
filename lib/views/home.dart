import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/res/data.dart';
import 'package:food_delivery/views/Commons/bottomSheets.dart';
import 'package:food_delivery/views/Commons/foodCard.dart';
import 'package:food_delivery/views/Commons/multiSelectFilter.dart';
import 'package:food_delivery/views/Commons/slide.dart';

final itemInCart = StateProvider((ref) => false);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          width: width * 0.6,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              "21st bkr st. ",
              style: TextStyle(
                   fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18, left: 6),
              child: Text(
                "Hits of the week",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            Container(
              width: double.infinity,
              height: height * 0.33,
              child: CaroselSlider(),
            ),
            MultiSelectFilter(),
            Column(
              children: List.generate(
                  FoodList.length,
                  (index) => Foodcard(
                        item: FoodList[index],
                      )),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, watch, _) {
          final cart = watch(itemInCart).state;
          return cart == true ? _cartButton(width) : Container();
        },
      ),
    );
  }

  _cartButton(var width) {
    return GestureDetector(
      onTap: () {
        cartBottomSheet(
          context,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            width: width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    "24min  \$47",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
