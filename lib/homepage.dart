//import 'package:carousel_pro/carousel_pro.dart';

import 'detailscreen.dart';
import 'listproducts/listforcart.dart';
import 'listproducts/listproduct1.dart';
import '/listproducts/listproduct2.dart';
import '/listproducts/listproductelec.dart';
import '/listproducts/listproductmen.dart';
import '/listproducts/listproductpant.dart';
import '/listproducts/listproductshoes.dart';
import '/listproducts/listproducttie.dart';
import '/listproducts/listproductwomen.dart';
import '/login.dart';
import '/notification_button.dart';
import '/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final GlobalKey<ScaffoldState> _formkey = GlobalKey<ScaffoldState>();

  late bool homecolor = false;
  late bool cartcolor = false;
  late bool aboutcolor = false;
  late bool contactuscolor = false;
  late bool logoutcolor = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Future openDialog() async {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text('Contact Us'),
              content: Container(
                height: 120,
                width: 150,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('8920975055'),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail),
                      title: Text('eshankhatter@'),
                    ),
                  ],
                ),
              )));
    }

    return Scaffold(
      key: _formkey,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Eshan Khatter',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              accountEmail: Text(
                'eshankhatter@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/userImage.png'),
              ),
            ),
            ListTile(
              selected: homecolor,
              onTap: () {
                setState(() {
                  homecolor = true;
                  cartcolor = false;
                  aboutcolor = false;
                  contactuscolor = false;
                  logoutcolor = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homepage(),
                    ),
                  );
                });
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              selected: cartcolor,
              onTap: () {
                setState(() {
                  cartcolor = true;
                  homecolor = false;
                  aboutcolor = false;
                  contactuscolor = false;
                  logoutcolor = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => listforcart(),
                    ),
                  );
                });
              },
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
            ),
            // ListTile(
            //   selected: aboutcolor,
            //   onTap: () {
            //     setState(() {
            //       aboutcolor = true;
            //       cartcolor = false;
            //       homecolor = false;
            //       contactuscolor = false;
            //       logoutcolor = false;
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => profilescreen(),
            //         ),
            //       );
            //     });
            //   },
            //   leading: Icon(Icons.info),
            //   title: Text('About'),
            // ),
            ListTile(
              selected: contactuscolor,
              onTap: () {
                setState(() {
                  contactuscolor = true;
                  cartcolor = false;
                  aboutcolor = false;
                  homecolor = false;
                  logoutcolor = false;
                  openDialog();
                });
              },
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
            ),
            ListTile(
              onTap: () {
                logoutcolor = true;
                contactuscolor = false;
                cartcolor = false;
                aboutcolor = false;
                homecolor = false;
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                });
              },
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _formkey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          notification_button(),
        ],
      ),
      body: Container(
        height: height,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            CarouselSlider(
                items: [
                  Image.asset(
                    'assets/womenwatch.jfif',
                    fit: BoxFit.cover,
                    width: width / 1.2,
                  ),
                  Image.asset(
                    'assets/tshirt.jfif',
                    fit: BoxFit.fill,
                    width: width / 1.2,
                  ),
                  Image.asset(
                    'assets/airpods.jfif',
                    fit: BoxFit.fill,
                    width: width / 1.2,
                  ),
                  Image.asset(
                    'assets/womencaro.jfif',
                    fit: BoxFit.fill,
                    width: width / 1.2,
                  ),
                ],
                options: CarouselOptions(
                  height: height / 4,
                  aspectRatio: 16 / 2,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: height / 8.2,
                width: width,
                //color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //color: Colors.blue,
                      height: height / 10,
                      //color: Colors.blue,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: circleavatar('assets/man3.png'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => listproductman()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: circleavatar('assets/wdress.png'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            listproductwomen()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: circleavatar('assets/shoes.png'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            listproductshoes()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: circleavatar('assets/pent.png'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            listproductpant()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: circleavatar('assets/tie.png'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => listproducttie()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                child: circleavatar(
                                    'assets/electroniccircular.jpg'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            listproductelec()),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listproduct(),
                              )),
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              //color: Colors.blue,
              height: height / 3.8,
              //color: Colors.blue,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 25.0.0', 'Man Shirt', 'assets/manshirt.jpg'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Man Shirt',
                                      price: 25.00,
                                      image: 'assets/manshirt.jpg')));
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
                          }),
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
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              //color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Achives',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => listproduct2(),
                            ),
                          ),
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              //color: Colors.blue,
              height: height / 3.8,
              //color: Colors.blue,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 30.0.0', 'Men Shoes', 'assets/menshoes.jpg'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Men Shoes',
                                      price: 30.00,
                                      image: 'assets/menshoes.jpg')));
                        },
                      ),
                      GestureDetector(
                        child: _buildfeaturesproduct(
                            '\$ 27.0.0', 'Man Pant', 'assets/menpant.jfif'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                      name: 'Man Pant',
                                      price: 27.00,
                                      image: 'assets/menpant.jfif')));
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
                    ],
                  ),
                ],
              ),
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
        height: height / 4,
        width: width / 2.5,
        child: Column(
          children: [
            Container(
              height: height / 5.5,
              width: width / 3,
              decoration: BoxDecoration(
                  //color: Colors.blue,
                  image: DecorationImage(
                image: AssetImage(Asset_image),
                fit: BoxFit.cover,
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
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleavatar(String Asset_image) {
    return CircleAvatar(
      maxRadius: 27,
      backgroundColor: Colors.lightBlue,
      child: Container(
        height: 60,
        //color: Colors.blue,
        child: Image(
          //color: Colors.white,
          image: AssetImage(Asset_image),
          fit: BoxFit.cover,
          height: 70,
          width: 60,
        ),
      ),
    );
  }
}
