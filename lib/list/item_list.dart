import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_1/models/cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemList extends StatefulWidget {
  num get harga => null;

  // ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<dynamic> items = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 360,
        width: double.infinity,
        margin: EdgeInsets.only(top: 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.1),
              child: FlatButton(
                splashColor: Colors.blue,
                onPressed: () {
                  _initData();
                },
                child: Text(
                  'Refresh',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Slidable(
                    // key: Key(carts[index].id),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.15,
                    child: Card(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      elevation: 8,
                      child: ListTile(
                        leading: Icon(
                          item['type'] == 'out'
                              ? Icons.subdirectory_arrow_left
                              : Icons.subdirectory_arrow_right,
                          color: item['type'] == 'out'
                              ? Colors.redAccent
                              : Colors.lightGreen,
                        ),
                        title: Text(
                          item['judul'] ?? 'judul',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        // subtitle: Text(carts[index].description),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['deskripsi'] ?? 'deskripsi'),
                            SizedBox(height: 7),
                            Text(item['tanggal'] ?? 'tanggal',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),

                        trailing: Text(
                          "Rp ${item['harga'] ?? ' 0'} ",
                          style: TextStyle(
                              color: item['type'] == 'out'
                                  ? Colors.redAccent
                                  : Colors.lightGreen),
                        ),
                      ),
                    ),
                    secondaryActions: [
                      //action button to show on tail
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.redAccent),
                        child: Icon(Icons.delete),
                        onPressed: () {
                          _hapusFB(item['id']);
                        },
                      ),

                      //   //add more action buttons here.
                    ],
                  );
                },
                itemCount: items.length,
              ),
            )
          ],
        ));
  }

  void _hapusFB(String id) async {
    await FirebaseFirestore.instance
        .collection('catat_barang')
        .doc(id)
        .delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('item telah dihapus'),
      ),
    );
    setState(() {
      items = items.where((element) => element['id'] != id).toList();
    });
  }

  void _initData() async {
    var colls =
        await FirebaseFirestore.instance.collection('catat_barang').get();
    setState(() {
      items = [];
      colls.docs.forEach((element) {
        var data = element.data();

        items.add({
          'tanggal': data['tanggal'],
          'judul': data['judul'],
          'deskripsi': data['deskripsi'],
          'harga': data['harga'],
          'type': data['type'],
          'id': element.id,
        });
      });
    });
  }
}
