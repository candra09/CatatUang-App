import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/cart.dart';

class ItemList extends StatelessWidget {
//DEFINISIKAN VARIABLE UNTUK MENAMPUNG DATA LIST CART
  final List<Cart> carts;

//BUAT CONSTRUCTOR UNTUK MEMINTA DATA LIST CARTNYA
  ItemList(this.carts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      margin: EdgeInsets.only(top: 0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            //UNTUK KETEBALAN AGAR MEMBENTUK SHADOW SENILAI 8
            elevation: 8,
            //CHILD DARI CARD MENGGUNAKAN LISTTILE AGAR LEBIH MUDAH MENGATUR AREANYA
            //KARENA SECARA DEFAULT LISTTILE TELAH TERBAGI MENJADI 3 BAGIAN
            //POSISI KIRI (LEADING), TENGAH (TITLE), BAWAH TENGAH (SUBTITLE) DAN KANAN(TRAILING)
            //SEHINGGA KITA HANYA TINGGAL MEMASUKKAN TEKS YANG SESUAI
            child: ListTile(
              leading: Icon(
                carts[index].type == 'out'
                    ? Icons.subdirectory_arrow_left
                    : Icons.subdirectory_arrow_right,
                color: carts[index].type == 'out'
                    ? Colors.redAccent
                    : Colors.lightGreen,
              ),
              title: Text(
                carts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(carts[index].description),
              trailing: Text(
                "Rp " + carts[index].price.toStringAsFixed(0),
                style: TextStyle(
                    color: carts[index].type == 'out'
                        ? Colors.redAccent
                        : Colors.lightGreen),
              ),
            ),
          );
        },
        itemCount: carts.length,
      ),
    );
  }
}
