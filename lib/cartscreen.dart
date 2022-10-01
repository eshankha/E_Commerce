import 'cartsingleproduct.dart';
import 'notification_button.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';

class cartscreen1 extends StatefulWidget {
  @override
  State<cartscreen1> createState() => _cartscreen1State();
}

class _cartscreen1State extends State<cartscreen1> {
  late ProductProvider productProvider;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => check_out1(),
                ));
          },
          color: Colors.purpleAccent,
          child: Text(
            'Continue',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Cart Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        // ),
        actions: [
          notification_button(),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCartModelListLength,
        itemBuilder: (context, index) => cartsingleproduct(
          isCount: false,
          index: index,
          price: productProvider.getCartModelList[index].price,
          name: productProvider.getCartModelList[index].name,
          image: productProvider.getCartModelList[index].image,
          quantity: productProvider.getCartModelList[index].quantity,
        ),
      ),
    );
  }
}
