import '/cartscreen.dart';
import '/checkout.dart';
import '/listproducts/listforcart.dart';
import '/listproducts/listproduct1.dart';
import '/listproducts/listproduct2.dart';
import '/listproducts/listproductelec.dart';
import '/listproducts/listproductmen.dart';
import '/listproducts/listproductpant.dart';
import '/listproducts/listproductshoes.dart';
import '/listproducts/listproducttie.dart';
import '/listproducts/listproductwomen.dart';
import '/product_provider.dart';
import '/profilescreen.dart';
import '/signup.dart';
import '/welcomscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detailscreen.dart';
import 'homepage.dart';
import 'login.dart';
import 'notification_button.dart';
import 'product_provider.dart';
import 'detailscreen.dart';

//import 'dart:js';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: welcomescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
