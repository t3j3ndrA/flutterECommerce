import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final String imageURL =
      "https://image.shutterstock.com/image-vector/ninja-vector-logo-260nw-1283132863.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            // User profile container
            Container(
              // height: 200,
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tejendra Dhanani",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "tejendradhanani@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTielTemplate("Home", Icons.home),
                  ListTielTemplate("Login", Icons.login),
                  ListTielTemplate(
                      "Profile", Icons.align_horizontal_right_sharp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ListTiel template

class ListTielTemplate extends StatelessWidget {
  // const ListTielTemplate({Key? key}) : super(key: key);

  final String title;
  var iconName;
  ListTielTemplate(this.title, this.iconName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconName, color: Colors.white, size: 30),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}
