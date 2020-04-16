import 'package:ecommerce_v4/model/product.dart';
import 'package:ecommerce_v4/model/tagModel.dart';
import 'package:ecommerce_v4/notify/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDetailsss extends StatefulWidget {

//  final DocumentSnapshot product_detail_name;
//  final DocumentSnapshot product_detail_image;
//  final DocumentSnapshot product_detail_new_price;
//  final DocumentSnapshot product_detail_price;
//  final DocumentSnapshot product_detail_brand;
//  final DocumentSnapshot product_detail_condition;
//  final DocumentSnapshot product_detail_description;

//  ProductDetails({
//    this.product_detail_name,
//    this.product_detail_image,
//    this.product_detail_price,
//    this.product_detail_new_price,
//    this.product_detail_brand,
//    this.product_detail_description,
//    this.product_detail_condition
//  });

  @override
  _ProductDetailsssState createState() => _ProductDetailsssState();
}

class _ProductDetailsssState extends State<ProductDetailsss> {


  @override
  Widget build(BuildContext context) {

    ProductNotifier productNotifier = Provider.of<ProductNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {},
          child: Text("Product Details"),
        ),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 250.0,
            child: GridTile(
              child: new Container(
                color: Colors.white,
//                child: Image.network(
////                    productNotifier.currentProduct.name
//                      widget.product_detail_image.data["image"]
//                ),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
//                  leading: new Text(
//                    productNotifier.currentProduct.name,
//                  widget.product_detail_name.data["name"],
//                    style: TextStyle(fontSize: 18.0),
//                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
//                        child: new Text(
//                            "\$${
////                                productNotifier.currentProduct.price
//                            widget.product_detail_new_price.data["price"]
//                            }"
//                        ),
                      ),

//                      Expanded(
//                        child: new Text("\$${
////                            productNotifier.currentProduct.old_price
//                              widget.product_detail_price.data["old_price"]
//                        }",
//                          style: TextStyle(
//                              color: Colors.red,
//                              decoration: TextDecoration.lineThrough
//                          ),),
//                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Add to Cart"),
                ),
              ),
              new IconButton(icon: Icon(Icons.favorite_border), onPressed: (){}),
            ],
          ),

          Divider(
            thickness: 3,
          ),

//          new ListTile(
//            title: Padding(
//              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//              child: new Text("Products Details: "),
//            ),
//            subtitle: new Text(widget.product_detail_description.data["description"]),
//          ),

          Divider(thickness: 3,),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Products Name: ",
                  style: TextStyle(color: Colors.grey),),
              ),

              Padding(
                padding: EdgeInsets.all(5.0),
//                child: new Text(
////                    productNotifier.currentProduct.name
//                      widget.product_detail_name.data["name"]
//                ),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Products Brand: ",
                  style: TextStyle(color: Colors.grey),),
              ),

              Padding(
                padding: EdgeInsets.all(5.0),
//                child: new Text(
////                    productNotifier.currentProduct.brand
//                widget.product_detail_brand.data["brand"],
//                ),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product Condition: ",
                  style: TextStyle(color: Colors.grey),),
              ),

              Padding(
                padding: EdgeInsets.all(5.0),
//                child: new Text(
////                    productNotifier.currentProduct.condition
//                widget.product_detail_condition.data["condition"],
//                ),
              )
            ],
          )
        ],
      ),
    );
  }
}



