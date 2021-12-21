import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecom/models/items.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cart_page.dart';

class ProductDetails extends StatefulWidget {
  final Item item;

  ProductDetails(this.item);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dummyDetail =
      "A Brand New product on Sale with 20% Discount on purchace. This is the further details about the product and you can find much more here. Just click below the buy now button without checking the price and enjoy the sale. Give gift to your loved once and family members and give them Big surprise on Christmase!";
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${widget.item.price}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Item recvd = Catalog().getProductById(item.id);
                Cart.cartItems.add(widget.item);
                setState(() {
                  isAdded = true;
                });
                Fluttertoast.showToast(
                  msg: "${widget.item.name} added!",
                  textColor: Colors.red,
                  backgroundColor: Colors.yellow,
                  fontSize: 24,
                );
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  isAdded = false;
                });
              },
              child: isAdded
                  ? Icon(Icons.done)
                  : Icon(CupertinoIcons.cart_badge_plus),
              // label: Text("Buy"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[900]),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
                tag: Key(widget.item.id.toString()),
                child: Center(
                  child: Image(
                    image: NetworkImage(widget.item.img),
                    height: 350,
                  ),
                )),
            Text(
              widget.item.name.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              widget.item.desc.toString(),
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Text(
                dummyDetail,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
