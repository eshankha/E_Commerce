import 'package:animated_splash_screen/animated_splash_screen.dart';
import '/homepage.dart';
import '/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  State<welcomescreen> createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      backgroundColor: Colors.grey,
      splash: Container(
        height: height,
        width: width,
        //color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.shopping_cart_checkout_sharp,
              color: Colors.black,
              size: 100,
            ),
            //Text('Welcome To E-Commerce'),
          ],
        ),
      ),
      nextScreen: signup(),
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
    );

    // return Scaffold(
    //   body: Center(
    //     child: Container(
    //       height: height,
    //       width: width,
    //       //color: Colors.blue,
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(top: 80),
    //             child: Container(
    //               height: height / 1.8,
    //               width: width,
    //               decoration: BoxDecoration(
    //                   //color: Colors.blue,
    //                   image: DecorationImage(
    //                       image: AssetImage('assets/shopping.png'))),
    //               child: Padding(
    //                 padding: const EdgeInsets.only(top: 410, left: 140),
    //                 child: Text(
    //                   'Welcome ',
    //                   style: TextStyle(
    //                     fontSize: 35,
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: height / 3.5,
    //             width: width,
    //             //color: Colors.blue,
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 40, top: 20),
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     'Ready to Start Shopping !',
    //                     style: TextStyle(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w500,
    //                       color: Colors.black,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 50,
    //                   ),
    //                   Container(
    //                     height: 45,
    //                     width: 400,
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 1, right: 20),
    //                       child: RaisedButton(
    //                         onPressed: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => signup()),
    //                           );
    //                         },
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(20.0),
    //                         ),
    //                         color: Colors.purpleAccent,
    //                         child: Text(
    //                           'Sign Up',
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w500,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   Row(
    //                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.only(left: 40),
    //                         child: Text(
    //                           'Already Have an Account ?',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: 15,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ),
    //                       GestureDetector(
    //                         child: Text(
    //                           'Login',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.w400,
    //                             fontSize: 20,
    //                             color: Colors.purpleAccent,
    //                           ),
    //                         ),
    //                         onTap: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                                 builder: (context) => login()),
    //                           );
    //                         },
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
