import 'package:flutter/material.dart';
import 'package:food_delivery/views/Commons/bottomSheets.dart';
import 'package:food_delivery/views/Commons/counterButton.dart';
import 'package:food_delivery/views/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Foodcard extends StatefulWidget {
  final Map item;

  const Foodcard({Key key, this.item}) : super(key: key);

  @override
  _FoodcardState createState() => _FoodcardState();
}

class _FoodcardState extends State<Foodcard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var kcal = widget.item['stats'];
    kcal = kcal['kcal'];
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
      child: GestureDetector(
        onTap: (){
          foodDetailBottomSheet(context, widget.item);
        },
        child: Row(
          children: [
            Image.asset(
              widget.item['imagePath'],
              fit: BoxFit.contain,
              width: width * 0.4,
              height: height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.item['name']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.2,
                        height: height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300,
                        ),
                        child: Center(
                          child: Text(
                            "\$${widget.item['price']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$kcal Kcal",
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
