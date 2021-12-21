import 'package:ecom/models/catalog.dart';
import 'package:ecom/models/items.dart';
import 'package:ecom/pages/cart_page.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

class ItemView extends StatefulWidget {
  final Item item;
  ItemView(this.item);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(children: [
          // Image of product
          Image(
            image: NetworkImage(widget.item.img),
            width: 120,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 20,
          ),
          // Expanded of desctiptions
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              SizedBox(
                height: 4,
              ),

              Text(
                widget.item.desc,
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),

              // Price & Buy Button row
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.item.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Item recvd = Catalog().getProductById(item.id);
                      Cart.cartItems.add(widget.item);

                      Fluttertoast.showToast(
                        msg: "${widget.item.name} added!",
                        textColor: Colors.red,
                        backgroundColor: Colors.yellow,
                        fontSize: 24,
                      );
                      setState(() {
                        isAdded = true;
                      });
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
            ],
          ))
        ]),
      ),
    );
  }
}
