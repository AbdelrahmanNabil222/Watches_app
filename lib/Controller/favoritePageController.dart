import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class FavoritePageController extends GetxController {
  // get the favorite collection data
  List data = [];
  getdata() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('favorite')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('favoriteproducts')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

////////////// Remove the doc from the favorite page
  removeTheProductFromFavoritePage({var docid}) async {
    Get.snackbar('Fav', '',
        duration: Duration(seconds: 1),
        messageText: CustomText(
          text: 'Had been removed from favorite',
          fontSize: 16,
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
  // When click in the product heart in the favorite page then will Return the Heart color of product To Black In the shopPage

  ////////////////////// Quartiz
  returnColorToBlackQuartiz(
    var number,
  ) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('Pi66PkdpCvBisYttVXvL')
        .collection('heartsColors');
    return color
        .doc('${FirebaseAuth.instance.currentUser!.email}${number}')
        .update({'black': 4278190080})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  ///////////////////// Solar
  returnColorToBlackSolar(var number) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('ZT1i1Qaq1dpQB9cbgii3')
        .collection('heartsColors');
    return color
        .doc('${FirebaseAuth.instance.currentUser!.email}${number}')
        .update({'black': 4278190080})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

////////////Automatic
  returnColorToBlackAuto(var number) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('NWOodtFIvsiGve18F0yk')
        .collection('heartsColors');
    return color
        .doc('${FirebaseAuth.instance.currentUser!.email}${number}')
        .update({'black': 4278190080})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }

  ////////////////////////Mechanical
  returnColorToBlackMechan(var number) {
    CollectionReference color = FirebaseFirestore.instance
        .collection('shop')
        .doc('7DhrUDzClGB3zRH2c277')
        .collection('heartsColors');
    return color
        .doc('${FirebaseAuth.instance.currentUser!.email}${number}')
        .update({'black': 4278190080})
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }
}
