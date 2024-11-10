import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  String? sizevalue;
  //Add the user order
  addUserOrder({var watchname, var price, var image}) {
    CollectionReference usersCart = FirebaseFirestore.instance
        .collection('userscart')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('orders');

    return usersCart
        .add({
          'email': FirebaseAuth.instance.currentUser!.email,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': watchname,
          'priceofonepiece': double.parse(price!),
          'priceoftotalamount': double.parse(price!),
          'size': sizevalue,
          'image': image,
          'amount': 1,
        })
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  //chicking the internet
  var internetStatus;
  checkTheInternetStatus() async {
    internetStatus = await Connectivity().checkConnectivity();
    update();
  }

  @override
  void onInit() {
    checkTheInternetStatus();
    super.onInit();
  }
}
