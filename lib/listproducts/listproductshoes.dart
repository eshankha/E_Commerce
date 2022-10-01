import 'package:basic/homepage.dart';
import 'package:flutter/material.dart';
import 'package:basic/detailscreen.dart';

class listproductshoes extends StatefulWidget {
  const listproductshoes({Key? key}) : super(key: key);

  @override
  State<listproductshoes> createState() => _listproductshoesState();
}

class _listproductshoesState extends State<listproductshoes> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shoes',
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
                            '\$ 10.0.0', 'Sport Shoes', 'assets/shoes1.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Sport Shoes',
                                      price: 10.00,
                                      image: 'assets/shoes1.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 20.0.0', 'Black Loafer', 'assets/shoes2.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Black Loafer',
                                      price: 20.00,
                                      image: 'assets/shoes2.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct('\$ 30.0.0',
                            'White Sneaker ', 'assets/shoes3.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'White Sneaker',
                                      price: 30.00,
                                      image: 'assets/shoes3.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 17.0.0', 'Sport Shoes', 'assets/shoes4.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Sport Shoes',
                                      price: 17.00,
                                      image: 'assets/shoes4.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 25.0.0', 'Nike Shoes', 'assets/shoes5.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Nike Shoes',
                                      price: 25.00,
                                      image: 'assets/shoes5.jfif')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 18.0.0', 'Adidas Shoes', 'assets/shoes6.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Adidas Shoes',
                                      price: 18.00,
                                      image: 'assets/shoes6.jfif')));
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
