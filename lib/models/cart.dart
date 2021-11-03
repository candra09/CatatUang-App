import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String title;
  final String description;
  final double price;
  final String type;

  //BUAT CONSTRUCTOR DIMANA SECARA DEFAULT CLASS INI AKAN MEMINTA DATA TERSEBUT
  Cart(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.type});
}
