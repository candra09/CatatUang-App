import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/screen/login.dart';
import '../authentication.dart';
import '../screen/dashboard.dart';
import '../list/item_list.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(),
            ItemList(),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 20),
        height: 50,
        width: 50,
        child: FloatingActionButton(
          onPressed: () {
            AuthenticationHelper()
                .signOut()
                .then((_) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (contex) => LoginPage()),
                    ));
          },
          child: Icon(Icons.logout),
          // backgroundColor: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
