import 'package:flutter/material.dart';
import 'package:sqflite_demo/db/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage(this.product, {super.key});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState(product);
}
DbHelper dbHelper = DbHelper();
enum Choice { Delete, Update }

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Product product;
  _ProductDetailsPageState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Choice>(
              onSelected: selectPopup,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                const PopupMenuItem<Choice>(
                  value: Choice.Delete,
                  child: Text('Delete product'),
                ),
                const PopupMenuItem<Choice>(
                  value: Choice.Update,
                  child: Text('Update Product'),
                )
              ])
        ],
      ),
      body: Column(
        children: <Widget>[
          MyContainer(
            productName: product.name,
            size: 25,
          ),
          SizedBox(width: 300,
            height: 300,
            child: Image(
              fit: BoxFit.contain,
              image: NetworkImage(product.imageUrl!),
            ),
          ),
          MyContainer(
            productName: product.description,
            size: 15,
          ),
          MyContainer(
            productName: "${product.price}₺",
            size: 30,
          ),
          ButtonBar(children: <Widget>[
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Success"),
                      content: Text("${product.name} added to cart"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style:
              TextButton.styleFrom(backgroundColor: Colors.pinkAccent[100]),
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ])
        ],
      ),
    );
  }

  void selectPopup(Choice choice) async {
    int result;
    switch(choice){
      case Choice.Delete:
        Navigator.pop(context,true);
        result = await dbHelper.delete(product.id);
        if(result!=0){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Success"),
                content: Text("${product.name} is deleted"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
        break;
      case Choice.Update:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Success"),
              content: Text("${product.name} is updated"),
              actions: <Widget>[
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        break;
      default:
        break;
    }
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.productName, required this.size});

  final String productName;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        productName,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}