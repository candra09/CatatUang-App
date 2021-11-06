import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_application_project_1/screen/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  height: 50,
                ),
                Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Container(
                          // height: 200,
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          width: double.infinity,
                          // padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Color(0xff238E3B),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Icon(Icons.person,
                                      size: 60, color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text('Regristrasi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  )),
                              SizedBox(height: 20),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.person, size: 20),
                                    hintText: "Nama",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.person, size: 20),
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.lock, size: 20),
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.email, size: 20),
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.phone, size: 20),
                                    hintText: "No Handphone",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon:
                                        Icon(Icons.location_on_sharp, size: 20),
                                    hintText: "Alamat",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                              ),
                              SizedBox(height: 20),
                              Container(
                                  height: 45,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      color: Color(0xff238E3B),
                                      borderRadius: BorderRadius.circular(32)),
                                  padding: EdgeInsets.all(10),
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text('Regrister',
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                        )),
                                  )),
                              FlatButton(
                                  splashColor: Colors.blue,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text('Back to Login',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ))),
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
