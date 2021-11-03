import 'package:flutter/material.dart';
import '../screen/home.dart';
import '../screen/register.dart';
import '../main_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff9ADC2F),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            // height: 200,
                            padding: EdgeInsets.all(10),
                            width: double.infinity,

                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Color(0xff238E3B),
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(Icons.person,
                                        size: 70, color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('Login',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      prefixIcon: Icon(Icons.email, size: 30),
                                      hintText: "Email",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(15, 15, 15, 15),
                                      prefixIcon: Icon(Icons.lock, size: 30),
                                      hintText: "Password",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          borderSide:
                                              BorderSide(color: Colors.white))),
                                ),
                                SizedBox(height: 40),
                                Container(
                                    height: 60,
                                    width: 400,
                                    padding: EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff238E3B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        elevation: 15.0, // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyScreen()));
                                      },
                                      // style: ElevatedButton.styleFrom(primary: Colors.yellow),
                                      child: Text('Login',
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          )),
                                    )),
                              ],
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('New User?'),
                      TextButton(
                          // splashColor: Colors.blue,
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          // style: ElevatedButton.styleFrom(primary: Colors.yellow),
                          child: Text('Register',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ))),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
