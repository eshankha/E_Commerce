import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '/homepage.dart';
import 'package:email_validator/email_validator.dart';
import '/signup.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();

  late String _name, _email, _phone;
  void validation() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        return (print('Succesful'));
      } else {
        return (print('Unsuccesful'));
      }
    });
  }

  void Validateemail() {
    setState(() {
      bool isvalid = EmailValidator.validate(emailcon.text.trim());
      if (isvalid) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromRGBO(191, 223, 240, 1),
            content: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Valid Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.green),
                  ),
                ],
              ),
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color.fromRGBO(191, 223, 240, 1),
            content: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.highlight_off,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Not a Valid Email',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.red),
                  ),
                ],
              ),
            )));
      }
    });
  }

  bool obserText = true;
  void isPassword() {
    setState(() {
      obserText = !obserText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              //color: Colors.purpleAccent,
              child: Column(
                children: [
                  Container(
                    height: height / 4,
                    width: width,
                    //color: Colors.amber,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: height / 1.7,
                    width: width,
                    //color: Colors.lightBlueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: emailcon,
                          onSaved: (email) {
                            setState(() {
                              email = email!;
                              print(email);
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              child: Icon(Icons.email),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passcon,
                          obscureText: obserText,
                          validator: (value) {
                            if (value == '') {
                              return 'Please Fill Password';
                            } else if (value!.length < 8) {
                              return 'Password is too short';
                            }
                            return '';
                          },
                          onSaved: (password) {
                            setState(() {
                              password = password!;
                              print(password);
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              child: Icon(Icons.password_sharp),
                            ),
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                isPassword();
                              },
                              child: Icon(
                                obserText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: width,
                          height: height / 13,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: emailcon.text,
                                password: passcon.text,
                              )
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homepage()));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                              validation();
                              Validateemail();
                            },
                            color: Colors.lightBlue,
                            child: Text('Login'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Did not Have an Account ?',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup())),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
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
        ),
      ),
    );
  }
}
