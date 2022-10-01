import 'notification_button.dart';
import 'package:flutter/material.dart';
import 'cartscreen.dart';
import 'homepage.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';

class detailscreen extends StatefulWidget {
  late final String name;
  late final String image;
  late final double price;
  detailscreen({required this.name, required this.price, required this.image});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  List<bool> isSelected = [true, false, false, false];
  List<bool> Colored = [true, false, false, false];

  late ProductProvider productProvider;

  int count = 1;

  void _add() {
    setState(() {
      count++;
    });
  }

  void _subtract() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: 100,
        //color: Colors.blue,
        child: RaisedButton(
          onPressed: () {
            productProvider.getCartData(
              name: widget.name,
              image: widget.image,
              price: widget.price,
              quantity: count,
            );
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => cartscreen1()));
          },
          color: Colors.purple[400],
          child: Text(
            'Add To Cart',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detail Page',
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
                context, MaterialPageRoute(builder: (context) => homepage()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          notification_button(),
        ],
      ),
      body: Container(
        //color: Colors.amber,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: height / 3,
                    width: width,
                    //color: Colors.redAccent,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: height / 3.6,
                          width: width / 1.9,
                          decoration: BoxDecoration(
                              //color: Colors.blue,
                              image: DecorationImage(
                            image: AssetImage(widget.image),
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height / 11.7,
                  width: width,
                  // color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$ ${widget.price.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height / 4.8,
                  width: width,

                  padding: EdgeInsets.all(18.0),
                  // color: Colors.blue,

                  // color: Colors.purple,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          'Description :',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: const [
                          Text(
                            'E-commerce application is a platform where there is buying and selling of products and services which are done by businesses and consumers via an electronic medium ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Container(
                  height: height / 2.2,
                  width: width / 0.9,
                  //color: Colors.blue,
                  child: Column(
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleButtons(
                        children: [
                          Text('S'),
                          Text('M'),
                          Text('L'),
                          Text('XL'),
                        ],
                        isSelected: isSelected,
                        splashColor: Colors.red,
                        disabledColor: Colors.green,
                        onPressed: (int newindex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newindex) {
                                isSelected[index] = true;
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleButtons(
                        children: [
                          colorproduct(Colors.lightGreen),
                          colorproduct(Colors.purpleAccent),
                          colorproduct(Colors.orangeAccent),
                          colorproduct(Colors.lime),
                        ],
                        splashColor: Colors.red,
                        disabledColor: Colors.green,
                        isSelected: Colored,
                        onPressed: (int newindex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newindex) {
                                Colored[index] = true;
                              } else {
                                Colored[index] = false;
                              }
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            //color: Colors.red,
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              color: Colors.purple[400],
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _subtract();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${count}', //Text(count.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _add();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Container(
                      //   height: height / 15,
                      //   width: width / 1.2,
                      //   //color: Colors.blue,
                      //   child: RaisedButton(
                      //     onPressed: () {
                      //       productProvider.getCartData(
                      //         name: widget.name,
                      //         image: widget.image,
                      //         price: widget.price,
                      //         quantity: count,
                      //       );
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => cartscreen1()));
                      //     },
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //     ),
                      //     color: Colors.purple[400],
                      //     child: Text(
                      //       'Add To Cart',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget colorproduct(Color color) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 40,
        width: 40,
        color: color,
      ),
    );
  }
}
