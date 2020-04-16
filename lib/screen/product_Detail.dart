import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetails extends StatefulWidget {

  final DocumentSnapshot productDetail_brand;

  ProductDetails({this.productDetail_brand});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product name"),//Product name from previous screen
      ),

      body: Center(
        child: new Card(
            child: ListTile(
              title: Text(widget.productDetail_brand.data["brand"]),
            ),
        ),
      )

    );
  }
}
