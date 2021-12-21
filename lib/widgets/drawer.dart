import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  final String imageURL =
      "https://image.shutterstock.com/image-vector/ninja-vector-logo-260nw-1283132863.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[700],
        child: ListView(
          children: [
            // User profile container
            Container(
              // height: 200,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(imageURL),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tejendra Dhanani",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "tejendradhanani@gmail.com",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTielTemplate("Home", Icons.home),
                  ListTielTemplate("Trace Your order", Icons.track_changes),
                  ListTielTemplate("Cart", CupertinoIcons.cart_badge_plus),
                  ListTielTemplate("Manage Account", Icons.account_box),
                  ListTielTemplate("Settings", Icons.settings),
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
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            iconName,
            color: Colors.white,
          )),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
