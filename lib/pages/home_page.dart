import 'dart:convert';
import 'package:ecom/models/catalog.dart';
import 'package:ecom/models/items.dart';
import 'package:ecom/pages/cart_page.dart';
import 'package:ecom/pages/product_details.dart';
import 'package:ecom/pages/testings.dart';
import 'package:ecom/widgets/drawer.dart';
import 'package:ecom/widgets/item_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await Future.delayed(Duration(seconds: 3));
    var response = await rootBundle.loadString("assets/API/catalogdata.json");
    var jsonData = jsonDecode(response);
    var products = jsonData["products"];
    print(products);
    Catalog.productList = List.from(products)
        .map<Item>((item) => Item(item["id"], item["name"], item["desc"],
            item["color"], item["image"], item["price"]))
        .toList();
    setState(() {
      // to reload the buidl method
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[700],
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Icon(
          CupertinoIcons.cart,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "E-Commerce Store",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
      ),
      body: Catalog.productList.length != 0
          ? ListView.builder(
              itemCount: Catalog.productList.length,
              itemBuilder: (context, index) {
                final item = Catalog.productList[index];
                return InkWell(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(item),
                              ))
                        },
                    child: Hero(
                        tag: Key(item.id.toString()), child: ItemView(item)));
              },
            )
          : SpinKitFadingCube(color: Colors.deepPurple),
      drawer: MyDrawer(),
    );
  }
}
