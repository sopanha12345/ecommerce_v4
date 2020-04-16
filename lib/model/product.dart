import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  String id;
  String name;
  List category = [];
  String image;
  String price;
  String old_price;
  String brand;
  String condition;
  String description;
  //List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;

  Product();

  Product.fromMap(Map<String, dynamic>data){
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
    //subIngredients = data['subIngredients'];
    condition = data['condition'];
    brand = data['brand'];
    description = data['description'];
    price = data['price'];
    old_price = data['old_price'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }


  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'name' : name,
      'category' : category,
      'image' : image,
      //'subIngredients' : subIngredients,
      'brand' : brand,
      'condition' : condition,
      'description' : description,
      'price' : price,
      'old_price' : old_price,
      'createdAt' : createdAt,
      'updatedAt' : updatedAt,
    };
  }
}