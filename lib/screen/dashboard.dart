import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/cart.dart';

class Dashboard extends StatelessWidget {
//DEFINISIKAN VARIABLE UNTUK MENAMPUNG DATA LIST CART
  final List<Cart> _listCart;

//BUAT CONSTRUCTOR UNTUK MEMINTA DATA LIST CARTNYA
  Dashboard(this._listCart);

  //buat getter menghitung total penghasilan
  double get Penghasilan {
    return _listCart.fold(0, (sum, item) {
      return sum += item.price;
    });
  }

  double get Pengurangan {
    return _listCart.fold(0, (sum, item) {
      return sum -= item.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        color: Color(0xff9ADC2F),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, left: 20),
              color: Color(0xff9ADC2F),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Budi ',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('085745554853',
                      style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
            ),
            Container(
              height: 100,
              child: Card(
                color: Colors.white,
                elevation: 15,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Penghasilan'),
                          SizedBox(height: 4),
                          Text(
                            Penghasilan.toStringAsFixed(0),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Pengeluaran'),
                          SizedBox(height: 4),
                          Text(Pengurangan.toStringAsFixed(0),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
