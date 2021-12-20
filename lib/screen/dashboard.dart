import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/list/item_list.dart';
import 'package:flutter_application_project_1/models/cart.dart';

class Dashboard extends StatelessWidget {
//DEFINISIKAN VARIABLE UNTUK MENAMPUNG DATA LIST CART
  // final List<ItemList> items;

//BUAT CONSTRUCTOR UNTUK MEMINTA DATA LIST CARTNYA
  // Dashboard(this.items);

  //buat getter menghitung total penghasilan

  // List<dynamic> items = [];

  // double get Penghasilan {
  //   return items.fold(0, (sum, item) {
  //     return sum += item.harga;
  //   });
  // }

  // double get Pengurangan {
  //   return items.fold(0, (sum, item) {
  //     return sum -= item.harga;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        color: Color(0xff9ADC2F),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.only(top: 40),
              color: Color(0xff9ADC2F),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              child: ListTile(
                leading: Icon(
                  Icons.auto_stories_outlined,
                  size: 30,
                ),
                title: Text(
                  "Catat Uang",
                  style: TextStyle(
                      fontFamily: "DancingScript",
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // _initData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
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
                            'Rp. 10.000',
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
                          Text('Rp. 5.000',
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
