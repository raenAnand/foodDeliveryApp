import 'package:flutter/material.dart';
import 'package:food_delivery/views/Commons/counterButton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/views/home.dart';

foodDetailBottomSheet(
  BuildContext context,
  Map item,
) {
  Map stats = item['stats'];
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  item['imagePath'],
                  fit: BoxFit.contain,
                  width: width * 0.8,
                  height: height * 0.3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${item['name']}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${item['description']}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width,
                height: height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (String key in stats.keys)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${stats["$key"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Text(
                                  "$key",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Colors.grey.shade400),
                                ),
                              ]),
                        )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: width * 0.4, child: CounterView()),
                  GestureDetector(
                    onTap: () {
                      context.read(itemInCart).state = true;
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: width * 0.4,
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
                              "Add to cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "\$${item['price']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}

cartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We will deliver in \n24 minutes to the address:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "100a Hungry Rd  ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    "Change Address",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/Grilled-Chicken.png",
                    fit: BoxFit.contain,
                    width: width * 0.3,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Grilled Chicken",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      SizedBox(height: 20,),
                      Container(width: width * 0.3, child: CounterView()),
                    ],
                  ),
                  Text(
                    "\$47.00",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  Text(
                    "Cutlery",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(width: width * 0.3, child: CounterView()),
                ],),
              ),
              Divider(),
              Spacer(),
              Text(
                "Payment method",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey),
              ),
              ListTile(
                title: Text("Apple Pay"),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,),
              ),
              GestureDetector(
                onTap: () {
                  context.read(itemInCart).state = true;
                  Navigator.pop(context);
                },
                child: Container(
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
                          "Add to cart",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        Text(
                          "\$47",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      );
    },
  );
}
