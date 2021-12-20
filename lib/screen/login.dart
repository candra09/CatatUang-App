import 'package:flutter/material.dart';
import '../authentication.dart';
import '../screen/register.dart';
import '../main_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        backgroundColor: Color(0xff9ADC2F),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          Container(
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
                                Text('Login',
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
                                  obscureText: _obscureText,
                                  onSaved: (val) {
                                    password = val;
                                  },
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
                                      // Respond to button press

                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();

                                        AuthenticationHelper()
                                            .signIn(
                                                email: email,
                                                password: password)
                                            .then((result) {
                                          if (result == null) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyScreen()));
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
                                      'Login',
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
              ),
            ),
          ),
        ])));
  }
}
