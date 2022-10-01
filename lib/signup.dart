import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

import 'login.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  TextEditingController usercon = TextEditingController();
  TextEditingController phonecon = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name, email, _phone, password;

  void validation() {
    setState(() {
      if (_formKey.currentState!.validate()) {
        return (print('Succesful'));
        //try{
        //AuthResult  result = await FirebaseAuth.instance
        // .createUserWithEmailAndPassword(
        // email: email,
        // password: password);
        //print(result.user.uid);
        // }on PlatformException catch(e){
        //print(e.message.toString());
        // }

      } else {
        return (print('Unsuccesful'));
      }
    });
  }

  bool obserText = true;
  void isPassword() {
    setState(() {
      obserText = !obserText;
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
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 235, 114, 114)),
                  ),
                ],
              ),
            )));
      }
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: height / 8,
                    width: width,
                    //color: Colors.lightBlue,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: height / 1,
                    width: width,
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          controller: usercon,
                          validator: (value) {
                            if (value == '') {
                              return 'Please Fill Username';
                            } else if (value!.length < 5) {
                              return 'Username is too short';
                            }
                            return '';
                          },
                          onSaved: (name) {
                            _name = name!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              child: Icon(Icons.person),
                            ),
                            hintText: 'UserName',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                          height: 10,
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
                          height: 10,
                        ),
                        TextFormField(
                          controller: phonecon,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == '') {
                              return 'Please Fill Phone No.';
                            } else if (value!.length < 10) {
                              return 'Enter a valid Phone No.';
                            }
                            return '';
                          },
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              child: Icon(Icons.phone),
                            ),
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          height: height / 13,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
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
                            child: Text('Register'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Already Have an Account',
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
                                      builder: (context) => login())),
                              child: Text(
                                'Login',
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
