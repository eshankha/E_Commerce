import 'cartscreen.dart';
import 'product_provider.dart';
import 'package:flutter/material.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';

import 'checkout.dart';

class cartsingleproduct extends StatefulWidget {
  late final String name;
  late final String image;
  late final double price;
  int quantity;
  final int index;
  final bool isCount;

  cartsingleproduct({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.index,
    required this.isCount,
  });

  @override
  State<cartsingleproduct> createState() => _cartsingleproductState();
}

class _cartsingleproductState extends State<cartsingleproduct> {
  late ProductProvider productProvider;

  void _add() {
    setState(() {
      widget.quantity++;
    });
  }

  void _subtract() {
    setState(() {
      if (widget.quantity > 1) {
        widget.quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                                        .deleteCartProduct(widget.index);
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
                            width: widget.quantity == false ? 120 : 100,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent[100],
                              //borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    productProvider.getCheckOutData(
                                        name: widget.name,
                                        image: widget.image,
                                        price: widget.price,
                                        quantity: widget.quantity);
                                    _subtract();
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                Text(
                                  '${widget.quantity}', //Text(count.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productProvider.getCheckOutData(
                                        name: widget.name,
                                        image: widget.image,
                                        price: widget.price,
                                        quantity: widget.quantity);
                                    _add();
                                  },
                                  child: Icon(Icons.add),
                                ),
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
