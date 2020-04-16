import 'package:cloud_firestore/cloud_firestore.dart';

class TagModel{
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

  TagModel({this.id,this.name,this.category,this.image,this.price,this.old_price,this.brand,
    this.condition,this.description,this.createdAt,this.updatedAt});

  factory TagModel.fromMap(Map<String, dynamic>data){
    return TagModel(
      id: data['name'],
      name: data['id'],
      category: data['category'],
      image: data['image'],
      price: data['price'],
      old_price: data['old_price'],
      brand: data['brand'],
      condition: data['condition'],
      description: data['description'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],

    );
  }
}