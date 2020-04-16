import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HorizontalCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/categories/cate_foods.png',
            image_caption: 'Foods',
          ),
          Category(
            image_location: 'images/categories/cate_drinks.png',
            image_caption: 'Drinks',
          ),
          Category(
            image_location: 'images/categories/cate_fruits.png',
            image_caption: 'Fruits',
          ),
          Category(
            image_location: 'images/categories/cate_vegetables.png',
            image_caption: 'Vegetables',
          ),
          Category(
            image_location: 'images/categories/cate_skincare.png',
            image_caption: 'Skin Care',
          ),
          Category(
            image_location: 'images/categories/cate_babycare.png',
            image_caption: 'Baby Care',
          ),
          Category(
            image_location: 'images/categories/cate_toys.png',
            image_caption: 'Toys',
          ),
          Category(
            image_location: 'images/categories/cate_electronic.png',
            image_caption: 'Electronic',
          ),
        ],
      ),
    );

  }
}



class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        highlightColor: Colors.green,
        onTap: (){
          print("${image_caption} Categories press is working.");
        },
        child: Container(
          width: 85.0,//we have to put width and height for scroll
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image_location,
                    width: 60.0,//we have to put width and height for scroll
                    height: 40.0,//we have to put width and height for scroll
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(image_caption,style: TextStyle(fontSize: 14),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}