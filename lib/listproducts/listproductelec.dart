import 'package:basic/homepage.dart';

import 'package:flutter/material.dart';

import '../detailscreen.dart';

class listproductelec extends StatefulWidget {
  const listproductelec({Key? key}) : super(key: key);

  @override
  State<listproductelec> createState() => _listproductelecState();
}

class _listproductelecState extends State<listproductelec> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Electronics Section',
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
                            '\$ 10.0.0', 'White Airpods', 'assets/elec1.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'White Airpods',
                                      price: 10.00,
                                      image: 'assets/elec1.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 20.0.0', 'Speaker', 'assets/elec2.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Speaker',
                                      price: 20.00,
                                      image: 'assets/elec2.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct('\$ 30.0.0',
                            'Stylish Speaker', 'assets/elec3.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Stylish Speaker',
                                      price: 30.00,
                                      image: 'assets/elec3.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 17.0.0', 'Black Watch', 'assets/elec4.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Black Watch',
                                      price: 17.00,
                                      image: 'assets/elec4.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 18.0.0', 'Apple Airpods', 'assets/elec5.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Apple Airpods',
                                      price: 18.00,
                                      image: 'assets/elec5.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 10.0.0', 'Rolex Watch', 'assets/elec6.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Rolex Watch',
                                      price: 10.00,
                                      image: 'assets/elec6.jfif')));
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
