import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'product_provider.dart';
import 'package:provider/provider.dart';



class notification_button extends StatefulWidget {
  const notification_button({Key? key}) : super(key: key);

  @override
  State<notification_button> createState() => _notification_buttonState();
}

class _notification_buttonState extends State<notification_button> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: Colors.red,
      position: BadgePosition(
        top: 8,
        end: 8,
      ),
      badgeContent: Text(
       '1',
        style: TextStyle(
          color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications_none,
        color: Colors.black,
        ),
      ),
    );
  }
}
