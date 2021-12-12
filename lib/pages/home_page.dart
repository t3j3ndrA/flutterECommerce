import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce Shop",
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          centerTitle: true,
          elevation: 0,
        ),
        body: Text("Home Screen"),
        drawer: Drawer(),
      ),
    );
  }
}
