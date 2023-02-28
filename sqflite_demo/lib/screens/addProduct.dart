import 'package:flutter/material.dart';
import 'package:sqflite_demo/db/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  DbHelper dbHelper = DbHelper();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtImage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: const InputDecoration(labelText: 'Name'),
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: txtPrice,
              decoration: const InputDecoration(labelText: 'Price'),
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: txtImage,
              decoration: const InputDecoration(labelText: 'ImageUrl'),
              style: const TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: txtDescription,
              decoration: const InputDecoration(labelText: 'Description'),
              style: const TextStyle(fontSize: 20.0),
            ),
            ElevatedButton(
              onPressed: () {
                save();
              },
              style: ElevatedButton.styleFrom(primary: Colors.pinkAccent[400]),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.black,fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }

  void save() async {
    int result = await dbHelper.insert(
      Product(
        txtName.text,
        txtDescription.text,
        double.tryParse(txtPrice.text),
        txtImage.text,
      ),
    );
    if (result != 0) {
      Navigator.pop(context, true);
    }
  }
}