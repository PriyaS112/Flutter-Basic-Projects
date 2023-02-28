import 'package:flutter/material.dart';
import 'package:sqflite_demo/db/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/addProduct.dart';
import 'package:sqflite_demo/screens/productDetail.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  DbHelper dbHelper = DbHelper();
  List<Product>? products;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      getData();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        titleTextStyle: const TextStyle(fontSize: 40.0,),
        centerTitle: true,
      ),
      body: productListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent[400],
        onPressed: () {
          goToAddProductPage();
        },
        tooltip: 'Add new product',
        child: const Icon(
          Icons.add,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  ListView productListView() {
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(products![position].imageUrl!),
              ),
              title: Text(products![position].name),
              subtitle: Text(products![position].description),
              onTap: () {
                goToDetailsPage(products![position]);
              },
            ),
          );
        });
  }

  void getData() {
    var db = dbHelper.initializeDb();
    db.then((result) {
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        List<Product> productsData = [];
        count = data.length;
        for (int i = 0; i < count; i++) {
          productsData.add(Product.fromObject(data[i]));
        }
        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

  void goToDetailsPage(Product product) async {
    bool? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetailsPage(product)));
    if (result != null) {
      if (result) {
        getData();
      }
    }
  }

  void goToAddProductPage() async {
    bool? result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddProductPage()));
    if (result != null) {
      if (result) {
        getData();
      }
    }
  }
}