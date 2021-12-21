import 'package:ecom/pages/cart_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:ecom/pages/testings.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "E-Commerce Shop",
    initialRoute: "/login",
    routes: {
      "/login": (context) => const LoginPage(),
      "/testings": (context) => const Testings(),
      "/cart": (context) => Cart(),
    },
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: HomePage(),
  ));
}
