import 'package:basic/homepage.dart';
import 'package:flutter/material.dart';

import '../detailscreen.dart';

class listproduct2 extends StatefulWidget {
  const listproduct2({Key? key}) : super(key: key);

  @override
  State<listproduct2> createState() => _listproduct2State();
}

class _listproduct2State extends State<listproduct2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New For You',
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
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height / 1.2,
                  //color: Colors.black,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.88,
                    mainAxisSpacing: 5,
                    children: [
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 30.0.0', 'Shoes', 'assets/menshoes.jpg'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Shoes',
                                      price: 30.00,
                                      image: 'assets/menshoes.jpg')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 20.0.0', 'Camera', 'assets/camera.jpg'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Camera',
                                      price: 20.00,
                                      image: 'assets/camera.jpg')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 13.0.0', 'Airpods', 'assets/airpods.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Airpods',
                                      price: 13.00,
                                      image: 'assets/airpods.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 17.0.0', 'Men Watch', 'assets/menwatch.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Men Watch',
                                      price: 17.00,
                                      image: 'assets/menwatch.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct('\$ 25.0.0',
                            'Women  Watch', 'assets/womenwatch.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Women Watch',
                                      price: 25.00,
                                      image: 'assets/womenwatch.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 18.0.0', 'Mouse', 'assets/mouse.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Mouse',
                                      price: 18.00,
                                      image: 'assets/mouse.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 10.0.0', 'Speaker', 'assets/speaker.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Speaker',
                                      price: 10.00,
                                      image: 'assets/speaker.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 8.0.0', 'T-Shirt', 'assets/tshirt.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: ' T- Shirt',
                                      price: 8.00,
                                      image: 'assets/tshirt.jfif')));
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
              height: 5,
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
              height: 5,
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
