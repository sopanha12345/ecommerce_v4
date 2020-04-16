import 'package:ecommerce_v4/notify/auth_notifier.dart';
import 'package:ecommerce_v4/notify/product_notifier.dart';
import 'package:ecommerce_v4/screen/product_Detail.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_v4/screen/MyHomePage.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_v4/screen/Login.dart';
void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (context) => AuthNotifier(),),
  ChangeNotifierProvider(create: (context) => ProductNotifier(),)
],
  child: MyApp(),
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
    );
  }
}
/*TODO: Stream Builder doesn't match DocumentSnapshot to other screen
* TODO: ProductDetails and MyHomePage*/
