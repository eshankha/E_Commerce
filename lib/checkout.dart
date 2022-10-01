import 'cartscreen.dart';
import 'checkoutsingleproduct.dart';
import 'homepage.dart';
import 'notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_provider.dart';

import 'cartsingleproduct.dart';
import 'detailscreen.dart';

class check_out1 extends StatefulWidget {
  @override
  State<check_out1> createState() => _check_out1State();
}

class _check_out1State extends State<check_out1> {
  late ProductProvider productProvider;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void validation() {
    setState(() {
      if (_formkey.currentState!.validate()) {
        return (print('Succesful'));
      } else {
        return (print('Unsuccesful'));
      }
    });
  }

  Future opendialog1() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Thank You'),
              content: Container(
                height: 150,
                width: 150,
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 30,
                        width: 30,
                        color: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      title: Text('Your Order Has Been Confirmed !'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
                        },
                        child: Text(
                          'Home Page',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Future openDialog() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Confirm Order'),
            content: Container(
              height: 100,
              width: 80,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TextFormField(
                    //   validator: (value) {
                    //     if (value == '') {
                    //       return 'Please Fill Address';
                    //     }
                    //     return '';
                    //   },
                    //   decoration: InputDecoration(hintText: ' Fill Address'),
                    // ),
                    // SizedBox(
                    //   height: 25,
                    // ),
                    // TextFormField(
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value == '') {
                    //       return 'Please Fill Pincode';
                    //     } else if (value!.length < 6) {
                    //       return 'Must of 6 Character';
                    //     } else {
                    //       return '';
                    //     }
                    //   },
                    //   decoration: InputDecoration(hintText: 'Pincode'),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          validation();
                          opendialog1();
                        },
                        child: Text(
                          'Confirm Order',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    double discount = 10;
    double discountRupees;
    double shipping = 20;
    double total;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    productProvider = Provider.of<ProductProvider>(context);

    productProvider.getCheckOutModelList.forEach((element) {
      subtotal += element.price * element.quantity;
    });

    // productProvider.getCheckOutModelList.forEach(
    //   (element) => {
    //     subtotal += element.price * element.quantity,
    //   },
    // );
    discountRupees = discount / 100 * subtotal;
    total = subtotal + shipping - discountRupees;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        child: RaisedButton(
          onPressed: () {
            openDialog();
          },
          color: Colors.purpleAccent,
          child: Text(
            'Buy',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'CheckOut Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => cartscreen1(),
                ));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          notification_button(),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: [
            Container(
                height: height / 1.8,
                //color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: productProvider.getCheckOutModelListLength,
                          itemBuilder: (context, index) {
                            return checkoutsingleproduct(
                              isCount: false,
                              index: index,
                              quantity: productProvider
                                  .getCheckOutModelList[index].quantity,
                              image: productProvider
                                  .getCheckOutModelList[index].image,
                              name: productProvider
                                  .getCheckOutModelList[index].name,
                              price: productProvider
                                  .getCheckOutModelList[index].price,
                            );
                          }),
                    ),

                    // GestureDetector(
                    //   child: _buildfeaturesproduct(
                    //       '\$ 27.0.0', 'Man Pant', 'assets/menpant.jfif'),
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => detailscreen(
                    //                 name: 'Man Pant',
                    //                 price: 27.00,
                    //                 image: 'assets/menpant.jfif')));
                    //   },
                    // ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 4.3),
              child: Container(
                height: height / 4,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildbottomdetailpart(
                        'Subtotal', '\$ ${subtotal.toStringAsFixed(2)}'),
                    _buildbottomdetailpart(
                        'Discount', '\$  ${discountRupees.toStringAsFixed(2)}'),
                    _buildbottomdetailpart(
                        'Shipping', '\$ ${shipping.toStringAsFixed(2)}'),
                    _buildbottomdetailpart(
                        'Total', '\$ ${total.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildbottomdetailpart(String fisrtname, String endname) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      //height: height / 9,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fisrtname,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            endname,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
