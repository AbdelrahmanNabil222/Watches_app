import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // incrementing the Amount Of The Product
  incrementTheProductAmount({var docid}) async {
    await FirebaseFirestore.instance
        .collection('userscart')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('orders')
        .doc(docid)
        .update({"amount": FieldValue.increment(1)});
  }

  // decrementing the Amount Of The Product
  decrementTheProductAmount({var docid}) async {
    await FirebaseFirestore.instance
        .collection('userscart')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('orders')
        .doc(docid)
        .update({"amount": FieldValue.increment(-1)});
  }

//The price oF Total Amount of Product after increment or decrement the amount
  priceoFTotalAmountofProduct({var docid, var operation}) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('userscart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('orders');

    return users
        .doc(docid)
        .update({'priceoftotalamount': (operation)})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //remove the product from the cart
  removeTheProductFromCart({var docid}) async {
    await FirebaseFirestore.instance
        .collection('userscart')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('orders')
        .doc(docid)
        .delete();
  }
}
