import 'package:basic/homepage.dart';

import 'package:flutter/material.dart';

import 'package:basic/detailscreen.dart';

class listproducttie extends StatefulWidget {
  const listproducttie({Key? key}) : super(key: key);

  @override
  State<listproducttie> createState() => _listproducttieState();
}

class _listproducttieState extends State<listproducttie> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Exclusive Items',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height / 1.2,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.74,
                    mainAxisSpacing: 5,
                    children: [
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 10.0.0', 'Tie', 'assets/tie1.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Tie',
                                      price: 10.00,
                                      image: 'assets/tie1.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 20.0.0', 'Blue Tie', 'assets/tie2.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Blue Tie',
                                      price: 20.00,
                                      image: 'assets/tie2.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 30.0.0', 'Red Bow', 'assets/tie3.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Red Bow',
                                      price: 30.00,
                                      image: 'assets/tie3.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 17.0.0', 'Red Tie', 'assets/tie4.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Red Tie',
                                      price: 17.00,
                                      image: 'assets/tie4.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 25.0.0', 'Bow', 'assets/tie5.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Bow',
                                      price: 25.00,
                                      image: 'assets/tie5.jfif')));
                        },
                      ),
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

  Widget _buildfeaturesproduct(String price, String name, String Asset_image) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        //color: Colors.blue,
        height: height / 8,
        width: width / 2.5,
        child: Column(
          children: [
            Container(
              height: height / 5.5,
              width: width / 3,
              decoration: BoxDecoration(
                  //color: Colors.blueGrey,
                  image: DecorationImage(
                image: AssetImage(Asset_image),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.purpleAccent,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
