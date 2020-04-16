import 'dart:io';
import 'package:ecommerce_v4/model/product.dart';
import 'package:ecommerce_v4/model/user.dart';
import 'package:ecommerce_v4/notify/auth_notifier.dart';
import 'package:ecommerce_v4/notify/product_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

login(User user, AuthNotifier authNotifier) async{
  AuthResult authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error)=> print (error.code));

  if(authResult != null){
    FirebaseUser firebaseUser = authResult.user;

    if(firebaseUser != null){
      print("Log In: $firebaseUser");
      authNotifier.setUser(firebaseUser);
    }
  }
}

signup(User user, AuthNotifier authNotifier) async{
  AuthResult authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((error) => print(error.code));

  if(authResult != null){

    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = user.displayName;

    FirebaseUser firebaseUser = authResult.user;

    if(firebaseUser != null){
      await firebaseUser.updateProfile(updateInfo);

      await firebaseUser.reload();

      print("Sign Up: $firebaseUser");

      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      authNotifier.setUser(currentUser);
    }
  }
}

signout(AuthNotifier authNotifier) async{
  await FirebaseAuth.instance.signOut().catchError((error) => print(error.code));

  authNotifier.setUser(null);

}

initializeCurrentUser(AuthNotifier authNotifier) async{
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();


  if(firebaseUser != null){
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}

getProducts(ProductNotifier productNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('Products')
      .getDocuments();

  List<Product> _productList = [];

  snapshot.documents.forEach((document){
    Product product = Product.fromMap(document.data);
    _productList.add(product);
  });

  productNotifier.productList = _productList;

}

//uploadFoodAndImage(Product product, bool isUpdating, File localFile) async{
//  if(localFile != null){
//    print("upload image");
//
//    var fileExtension = path.extension(localFile.path);
//    print(fileExtension);
//
//    var uuid = Uuid().v4();
//
//    final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('products/images/$uuid$fileExtension');
//
//    await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError){
//      print(onError);
//      return false;
//    });
//    String url = await firebaseStorageRef.getDownloadURL();
//    print("download url: $url");
//    _uploading(product, isUpdating, imageUrl: url);
//
//  }else{
//    print('...skipping image upload');
//    _uploading(product, isUpdating);
//  }
//}
//
//_uploading(Product product, bool isUpdating, {String imageUrl}) async{
//
//  CollectionReference foodRef = Firestore.instance.collection('Products');
//
//  if(imageUrl != null){
//    product.image = imageUrl;
//  }
//
//  if(isUpdating){
//    product.updatedAt = Timestamp.now();
//
//    await foodRef.document(product.id).updateData(product.toMap());
//    print('Updated food with id: ${product.id}');
//
//  }else{
//    product.createdAt = Timestamp.now();
//
//    DocumentReference documentRef = await foodRef.add(product.toMap());
//    product.id = documentRef.documentID;
//
//    print('upload food successfully: ${product.toString()}');
//
//    await documentRef.setData(product.toMap(), merge: true);
//  }
//
//}