import 'package:flutter/material.dart';

class Testings extends StatelessWidget {
  const Testings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Testings Zone"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // box, Column of name,subtitle, row price & buy now
              Row(
                children: [
                  Container(height: 80, width: 200, color: Colors.deepPurple),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(children: [
                    Text(
                      "This is the title but fuckin Big",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.indigo[900],
                      ),
                    ),
                    Text(
                        "This is the fukcing long and long description which is perfectly made to overflow!"),

                    // Price & Buy Now Row

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("999\$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        ElevatedButton(onPressed: () {}, child: Text("Buy")),
                      ],
                    )
                  ]))
                ],
              ),
            ],
          ),
        ));
  }
}
