import 'package:flutter/material.dart';
import 'edit_profil.dart';
import '../main_screen.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Color(0xff9ADC2F),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color(0xff238E3B), shape: BoxShape.circle),
                  child: Center(
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                )
              ],
            )),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.email,
                                color: Color(0xff9ADC2F),
                                size: 35,
                              ),
                              Text(
                                'Admin@gmail.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.phone,
                                color: Color(0xff9ADC2F),
                                size: 35,
                              ),
                              Text(
                                '0857455xxxxxxxxx',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Color(0xff9ADC2F),
                                size: 35,
                              ),
                              Text(
                                'jalan Angsa  no.11',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Center(
                    child: FlatButton(
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Color(0xff238E3B),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilPage()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                FlatButton(
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyScreen();
                      }));
                    },
                    child: Text('Back to Home',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
