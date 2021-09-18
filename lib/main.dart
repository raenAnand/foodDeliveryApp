import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/views/home.dart';

void main() {

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primary_color,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  static const primaryColor = Colors.white;

  static const Color primary_color =
  const MaterialColor(0xffF9F9F9, const <int, Color>{
    50: primaryColor,
    100: primaryColor,
    200: primaryColor,
    300: primaryColor,
    400: primaryColor,
    500: primaryColor,
    600: primaryColor,
    700: primaryColor,
    800: primaryColor,
    900: primaryColor
  });
}



