import 'dart:convert';

import 'package:ecommerce_v4/api/ecommerce_api.dart';
import 'package:ecommerce_v4/components/Horizontal_Catgories.dart';
import 'package:ecommerce_v4/components/ListHeader.dart';
import 'package:ecommerce_v4/components/NewsSlider.dart';
import 'package:ecommerce_v4/model/ProcheaPreyHttp.dart';
import 'package:ecommerce_v4/model/product.dart';
import 'package:ecommerce_v4/model/slidelist.dart';
import 'package:ecommerce_v4/model/tagModel.dart';
import 'package:ecommerce_v4/screen/product_Detail.dart';
import 'package:ecommerce_v4/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_v4/notify/auth_notifier.dart';
import 'package:ecommerce_v4/notify/product_notifier.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' show get;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_v4/screen/ShoppingCart.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}


Future<List<ProcheaPreyHttp>> getNewsSlide() async{
  var payloadList = downloadJson();
  return payloadList;
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    ProductNotifier productNotifier= Provider.of<ProductNotifier>(context, listen: false);
    getProducts(productNotifier);

    //_queryDb();
    super.initState();
  }

  final Firestore db = Firestore.instance;
  Stream slides;
  String activeTag = 'all';
//  String iconLocation;

  @override
  Widget build(BuildContext context) {

    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    ProductNotifier productNotifier = Provider.of<ProductNotifier>(context);

    Spacecraft product = Spacecraft();

    List<TagModel> tagModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("ecommerce-V4"),

        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new ShoppingCart()));
          })
        ],
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text(authNotifier.user != null ? authNotifier.user.displayName : "Unknown_User"),
              accountEmail: Text(authNotifier.user != null ? authNotifier.user.email : "Unknown_UserEmail"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  child: new Icon(Icons.person, size: 40.0, color: Colors.white,),
                  backgroundColor: Colors.grey,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.account_circle),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.border_color),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourite'),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(thickness: 4),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Setting'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: (){
//                signout(authNotifier);
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.power_settings_new),
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            child: Container(
              width: 410,
              height: 680,
              child: new CustomScrollView(
                slivers: <Widget>[
//                  ListHeader(),
//          SliverPersistentHeader(
//            pinned: true, floating: false, delegate: Delegate(),
//          ),

                  SliverFixedExtentList(
                    itemExtent: 200,
                    delegate: SliverChildListDelegate([
                      Container(
                        child: Card(
                          child: new FutureBuilder<List<ProcheaPreyHttp>>(
                            future: getNewsSlide(),
                            builder: (context, snapshot){
                              if(snapshot.hasError) print(snapshot.error);
                              return snapshot.hasData ? new NewsSlider(
                                list: snapshot.data,
                              ) : new Center(
                                child: new CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ),

                  StreamBuilder(
                    stream: slides,
                    initialData: [],
                    builder: (context, snap){
                      List slideList = snap.data.toList();

                       return SliverGrid(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             mainAxisSpacing: 8,
                             crossAxisSpacing: 8
                         ),

                         delegate: SliverChildBuilderDelegate(
                               (BuildContext context, int index){
                             return new Card(
                               child: new Column(
                                 children: <Widget>[

                                   Padding(
                                     padding: const EdgeInsets.only(bottom: 8.0),
                                     child: new Container(
                                       height: 130.0,
                                       width: 150.0,
                                       color: Colors.red,
                                       child: InkWell(
                                         onTap: (){
//                                           productNotifier.currentProduct = productNotifier.productList[index];
                                          navigatToDetails(slideList[index]);


                                         },
                                         child: GridTile(
                                           footer: Container(
                                             alignment: Alignment.center,
                                             height: 40.0,
                                             color: Colors.white70,
                                             child: new Row(
                                               children: <Widget>[
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child:
//                                                   new Text(productNotifier.productList[index].name,
                                                    new Text(
                                                      slideList[index]['name'],
//                                                        snap.data[index]['name'],
                                                     style: TextStyle(
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: 14.0
                                                     ),),
                                                 ),

                                                 Column(
                                                   children: <Widget>[
                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 8.0),
                                                       child: new Text(
//                                                         "\$${productNotifier.productList[index].price}",
                                                          "\$${slideList[index]['price']}",
                                                         style: TextStyle(
                                                             fontWeight: FontWeight.bold,
                                                             color: Colors.blue,
                                                             fontSize: 14.0
                                                         ),
                                                       ),
                                                     ),

                                                     Padding(
                                                       padding: const EdgeInsets.only(left: 8.0),
                                                       child: new Text(
//                                                         "\$${productNotifier.productList[index].old_price}",
                                                       "\$${slideList[index]['old_price']}",
                                                         style: TextStyle(
                                                             fontWeight: FontWeight.bold,
                                                             color: Colors.red,
                                                             fontSize: 14.0,
                                                             decoration: TextDecoration.lineThrough
                                                         ),),
                                                     )
                                                   ],
                                                 )
                                               ],
                                             ),
                                           ),
                                           child: Image.network(
//                                             productNotifier.productList[index].image,
                                            slideList[index]['image'] != null ? slideList[index]['image'] : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                                             fit: BoxFit.cover,),
                                         ),
                                       ),
                                     ),
                                   ),

                                   InkWell(
                                     onTap: (){},
                                     child: new Container(
                                       height: 38,
                                       width: 150.0,
                                       alignment: Alignment.center,
                                       decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50.0)),
                                       child: Row(
                                         children: <Widget>[
                                           Padding(
                                             padding: const EdgeInsets.only(left:20.0),
                                             child: new Text("Add to Cart", style: TextStyle(fontSize: 16,color: Colors.white)),
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(left:8.0),
                                             child: new Icon(Icons.add_shopping_cart, color: Colors.white,),
                                           )
                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             );
                           },
//                           childCount: slideList.length,
                              childCount: snap.data.length,
                         ),
                       );
                     },

                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 70,
              width: 412,
              color: Colors.black54,
                child: _buildListbutton(),
            ),
          )
        ],

      ),
    );
  }

  Stream _queryDb({String tag = 'all'}){
    //make a query
    Query query = db.collection('Products').where('category', arrayContains: tag);
    slides = query.snapshots().map((list)=> list.documents.map((doc) => doc.data));
    setState(() {
      activeTag = tag;
    });
  }

  _buildListbutton(){
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildButton('all','images/categories/cate_all.png','all'),
          _buildButton('baby care','images/categories/cate_babycare.png','Baby care'),
          _buildButton('drinks','images/categories/cate_drinks.png','Drinks'),
          _buildButton('foods','images/categories/cate_foods.png','Foods'),
          _buildButton('vegetable','images/categories/cate_vegetables.png','Vegetables'),
          _buildButton('toy','images/categories/cate_toys.png','Toys'),
          _buildButton('skin care','images/categories/cate_skincare.png','Skin Care'),
          _buildButton('fruit','images/categories/cate_fruits.png','Fruit'),
          _buildButton('electronic','images/categories/cate_electronic.png','Electronic'),
        ],
      ),
    );
  }

  _buildButton(tag,String iconLocation,String buttonCaption){
    Color color = tag == activeTag ? Colors.blue: Colors.white;
    return FlatButton(color: color,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Container(
                height: 30,
                child: Image.asset(iconLocation)),
            Container(
                padding: EdgeInsets.all(5.0),
                height: 30,
                child: Text(buttonCaption),
            )
        ],
    ),onPressed: () => _queryDb(tag: tag),);
  }

  navigatToDetails(DocumentSnapshot product) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return ProductDetails(productDetail_brand: product,);
        }
    ));
  }

}

Future<List<ProcheaPreyHttp>> downloadJson() async{
  final jsonData = "https://www.popular.com.kh/2017/wp-json/wp/v2/posts?categories=192";
  final response = await get(jsonData);

  if(response.statusCode == 200){
    List newsLayout = json.decode(response.body);
    return newsLayout.map((model)=> new ProcheaPreyHttp.fromJson(model)).toList();
  }else
    throw Exception("We weren't able to retrieve data from json");
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
