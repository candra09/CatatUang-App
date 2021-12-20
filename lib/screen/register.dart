import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_application_project_1/screen/login.dart';
import '../authentication.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;
  String name;
  bool _obscureText = true;

  bool agree = false;

  final pass = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9ADC2F),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
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
                                  offset: Offset(
                                      0, 2), // changes position of shadow
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
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    email = val;
                                  },
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2),
                                    prefixIcon: Icon(Icons.lock, size: 20),
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                  onSaved: (val) {
                                    password = val;
                                  },
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                //
                                SizedBox(height: 40),

                                SizedBox(
                                  height: 45,
                                  width: 250,
                                  child: RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        AuthenticationHelper()
                                            .signUp(
                                                email: email,
                                                password: password)
                                            .then((result) {
                                          if (result == null) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          } else {
                                            Scaffold.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                result,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ));
                                          }
                                        });
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    color: Color(0xff238E3B),
                                    textColor: Colors.white,
                                    child: Text(
                                      'Regristrasi',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                FlatButton(
                                    splashColor: Colors.blue,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
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
              ),
            )),
      ),
    );
  }
}
