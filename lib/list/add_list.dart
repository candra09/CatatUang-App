import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AddListPage extends StatefulWidget {
  @override
  _AddListPageState createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  var tanggal = '';
  var judul = '';
  var deskripsi = '';
  var harga = '';
  var type = '';

  DateTime _dueDate = DateTime.now();
  String _dateText = '';

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2023));

    if (picked != null) {
      setState(() {
        _dueDate = picked;
        _dateText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9ADC2F),
          leading: BackButton(color: Color(0xff9ADC2F)),
          title: Text('Tambah Catatan'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Tanggal(15/12/2019)',
                    prefixIcon: Icon(Icons.date_range),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (v) {
                    tanggal = v ?? '';
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Judul',
                    prefixIcon: Icon(Icons.dashboard),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (v) {
                    judul = v ?? '';
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Deskripsi ',
                    prefixIcon: Icon(Icons.note),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (v) {
                    deskripsi = v ?? '';
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    prefixIcon: Icon(Icons.price_change_outlined),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                  onChanged: (v) {
                    harga = v ?? '';
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Type(in/out)',
                    prefixIcon: Icon(Icons.dashboard),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (v) {
                    type = v ?? '';
                  },
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _simpanFB();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data telah ditambahkan')));
                      },
                      child: Text('Simpan'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _simpanFB() async {
    var collBarang = FirebaseFirestore.instance.collection('catat_barang');
    await collBarang.add({
      'tanggal': tanggal,
      'judul': judul,
      'deskripsi': deskripsi,
      'harga': harga,
      'type': type
    });
  }
}
