import 'cartscreen.dart';
import 'product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkoutsingleproduct extends StatefulWidget {
  late final String name;
  late final String image;
  late final double price;
  int quantity;
  final int index;
  final bool isCount;

  checkoutsingleproduct({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.index,
    required this.isCount,
  });

  @override
  State<checkoutsingleproduct> createState() => _checkoutsingleproductState();
}

class _checkoutsingleproductState extends State<checkoutsingleproduct> {
  late ProductProvider productProvider;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      //color: Colors.black,
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.fill)),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 550,
                          //color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.name),
                              IconButton(
                                  onPressed: () {
                                    productProvider
                                        .deleteCheckOutProduct(widget.index);
                                  },
                                  icon: Icon(Icons.close)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Clothes'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$ ${widget.price.toString()}',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                //color: Colors.blueAccent[100],
                                //borderRadius: BorderRadius.circular(20.0),
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Quantity"),
                                Text(
                                  widget.quantity.toString(),
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
