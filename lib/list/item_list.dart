import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemList extends StatelessWidget {
//DEFINISIKAN VARIABLE UNTUK MENAMPUNG DATA LIST CART
  final List<Cart> carts;

//BUAT CONSTRUCTOR UNTUK MEMINTA DATA LIST CARTNYA
  ItemList(this.carts);

  void setState(Null Function() param0) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      margin: EdgeInsets.only(top: 0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Slidable(
            //enable slidable in list
            key: Key(carts[index].id), //set key
            // you have to set key, other wise, after removing item from list, -
            // - slidable will be opened.
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.15,
            child: Card(
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

                // subtitle: Text(carts[index].description),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(carts[index].description),
                    SizedBox(height: 7),
                    Text(carts[index].date,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),

                trailing: Text(
                  "Rp " + carts[index].price.toStringAsFixed(0),
                  style: TextStyle(
                      color: carts[index].type == 'out'
                          ? Colors.redAccent
                          : Colors.lightGreen),
                ),
              ),
            ),
            secondaryActions: [
              //action button to show on tail
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                child: Icon(Icons.delete),
                onPressed: () {
                  //delete action for this button
                  carts.removeWhere((element) {
                    return element.id == carts[index].id;
                  }); //go through the loop and match content to delete from list
                  setState(() {
                    //refresh UI after deleting element from list
                  });
                },
              ),

              //add more action buttons here.
            ],
          );
        },
        itemCount: carts.length,
      ),
    );
  }
}
