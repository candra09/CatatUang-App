import 'package:flutter/material.dart';
import '../screen/dashboard.dart';
import '../list/add_list.dart';
import '../list/item_list.dart';
import '../models/cart.dart';
import '../screen/profil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Cart> _carts = [
    // TAMBAHKAN DATA DUMMY
    Cart(
        id: 'CC1',
        title: 'Makan Siang',
        description: 'Beli Makan Di Warteg',
        price: 10000,
        type: 'in'),
    Cart(
        id: 'CC2',
        title: 'Makan Siang',
        description: 'Beli Makan Di Warteg',
        price: 10000,
        type: 'out'),
    Cart(
        id: 'CC3',
        title: 'Makan Siang',
        description: 'Beli Makan Di Warteg',
        price: 10000,
        type: 'in'),
    Cart(
        id: 'CC4',
        title: 'Makan Siang',
        description: 'Beli Makan Di Warteg',
        price: 10000,
        type: 'out'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ItemList(_carts),
          ],
        ),
      ),
    );
  }
}
