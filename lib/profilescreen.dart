import 'notification_button.dart';
import 'package:flutter/material.dart';

class profilescreen extends StatefulWidget {

  const profilescreen({Key? key}) : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: edit== false ? IconButton(
          onPressed: () {
            edit==false;
          },
          icon: Icon(Icons.close,
          color: Colors.redAccent,
          size: 30),
        ): Container(),

        backgroundColor: Colors.white,
        actions: [

         edit == false ?
         notification_button()
          : IconButton(
        onPressed: () {

        },
    icon: Icon(Icons.check,
    color: Colors.green,
    size: 30),
    ),
        ],
      ),
      body: Container(
        height: height,
        width:  width,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height/4,
                    width: width,
                    //color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                                CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage('assets/userImage.png'),
                              ),
                      ],
                    ),
                  ),
                  edit==true ? Padding(
                    padding: const EdgeInsets.only(left: 230, top: 160),
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      maxRadius: 20,
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ) : Container(),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: height/2.3,
                  width: width,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Container(
                       height: height/2.3,
                       child: edit == true ?
                        Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           _buildtextform('Eshan'),
                           _buildtextform('eshankhatter@gmail.com'),
                           _buildtextform('Male'),
                           _buildtextform('8920975055'),
                         ],
                       )
                           : Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [

                       _buildSingleContainer('Name', 'Eshan Khatter'),
                      _buildSingleContainer('Email','eshankhatter@gmail.com'),
                      _buildSingleContainer('Gender', 'Male'),
                      _buildSingleContainer('Phone No.','8920975055'),

                    ],
                  ),
                     ),


                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height/15,
                width: width/1.9,
                child: edit ==false ? RaisedButton(
                  color: Colors.purple,
                  onPressed: () {
                  setState(() {
                    edit = true;
                  });
                  },
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ):Container(),

              ),
            ],
          ),
        ),
      ),

    );
  }
  Widget _buildSingleContainer(String startname, String endname ){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(startname,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black54,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(endname,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildtextform(String name){
    return TextFormField(
      decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
          )
      ),
    );
  }
}
