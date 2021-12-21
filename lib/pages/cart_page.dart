import 'package:ecom/models/catalog.dart';
import 'package:ecom/models/items.dart';
import 'package:ecom/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Cart extends StatefulWidget {
  static List<Item> cartItems = [];
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int sumUpTheTotal() {
    var totalAmmount = 0;
    for (int i = 0; i < Cart.cartItems.length; ++i) {
      totalAmmount += Cart.cartItems[i].price.toInt();
    }

    return totalAmmount;
  }

  @override
  Widget build(BuildContext context) {
    int totalAmmount = sumUpTheTotal();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${totalAmmount.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag),
              label: const Text("Buy", style: TextStyle(fontSize: 20)),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueGrey[900]),
              ),
            )
          ],
        ),
      ),
      body: Cart.cartItems.length == 0
          ? Center(
              child: Text(
                "Opps! Cart is empty.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28,
                ),
              ),
            )
          : ListView.builder(
              itemCount: Cart.cartItems.length,
              itemBuilder: (context, index) {
                Item item = Cart.cartItems[index];

                // Cart Item template
                return ListTile(
                  leading: const Icon(CupertinoIcons.check_mark),
                  title: Text(item.name),
                  trailing: IconButton(
                    onPressed: () {
                      for (int i = 0; i < Cart.cartItems.length; ++i) {
                        if (Cart.cartItems[i].id == item.id) {
                          Cart.cartItems.remove(item);
                          setState(() {
                            totalAmmount -= item.price.toInt();
                          });
                          break;
                        }
                      }
                    },
                    icon: const Icon(CupertinoIcons.minus_circle),
                  ),
                );
              }),
    );
  }
}
