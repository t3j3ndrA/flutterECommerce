import 'package:ecom/models/items.dart';
import 'package:flutter/material.dart';

class Catalog {
  // String desc =
  //     "This is the beautiful and handsome ninja with the best fighting quality and at the same time we are going with the maximum!";
  // var id = 1;
  // var img = "assests/images/secure_login.png";
  // final clr = "red";
  // final price = 999;
  static List<Item> productList = [];

  Item getProductById(int id) {
    for (int i = 0; i < productList.length; ++i) {
      if (productList[i].id == id) return productList[i];
    }
    print("Could Not find the product with the id :  $id");
    return productList[0];
  }
}
