import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopMechanicalWatchesController extends GetxController {
  // get the favorite the mechanical watches data
  List data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('shop')
        .doc('7DhrUDzClGB3zRH2c277')
        .collection('watchesdetails')
        .orderBy('number', descending: true)
        .get();
    data.addAll(querySnapshot.docs);
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

//Add the products to Favorite page Function
  addtofavoritee(
      {String? name,
      String? price,
      String? image,
      String? rate,
      var number}) async {
    //i will check if the product that i want to add to favoritePage ,had been added to favorite page before or not
    //get the product that i want to fav from favoritePage by it name
    final querySnapshot = await FirebaseFirestore.instance
        .collection('favorite')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('favoriteproducts')
        .doc(name)
        .get();
    //if the product that i want to fav,was founded in the favoritePage then return false
    if (querySnapshot.exists) {
      return false;
    }
    //if the product that i want to fav, doesnt founded in the favoritePage
    else {
      //add the product to favoritePage
      Get.snackbar('Fav', '',
          duration: Duration(seconds: 1),
          messageText: Text(
            'Had been added to favorite',
            style: TextStyle(fontSize: 16),
          ));
      CollectionReference usersfav = FirebaseFirestore.instance
          .collection('favorite')
          .doc(
            FirebaseAuth.instance.currentUser!.email,
          )
          .collection('favoriteproducts');
      return usersfav
          .doc('${FirebaseAuth.instance.currentUser!.email}$name')
          .set({
            'email': FirebaseAuth.instance.currentUser!.email,
            'id': FirebaseAuth.instance.currentUser!.uid,
            'name': name,
            'price': price,
            'image': image,
            'rate': rate,
            'number': number,
            'type': 'Mechan',
          })
          .then((value) => print("order Added"))
          .catchError((error) => print("Failed to add order: $error"));
    }
  }

  /////////////make the product heart red in the shop
  makingTheHeartRedinTheShop({var docid}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('7DhrUDzClGB3zRH2c277')
        .collection('heartsColors');
    return color
        .doc(docid)
        .update({'black': 4294198070})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  ///////////////remove the product from favorite page
  removeTheProdutFromFavorite({var docid}) async {
    Get.snackbar('Fav', '',
        duration: Duration(seconds: 1),
        messageText: Text(
          'Had been removed from favorite',
          style: TextStyle(fontSize: 16),
        ));
    await FirebaseFirestore.instance
        .collection('favorite')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('favoriteproducts')
        .doc(docid)
        .delete();
  }

  ///////////////make the product heart black in the shop
  makingTheHeartBlackInTheShop({var docid}) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('7DhrUDzClGB3zRH2c277')
        .collection('heartsColors');
    return color
        .doc(docid)
        .update({'black': 4278190080})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }
}
