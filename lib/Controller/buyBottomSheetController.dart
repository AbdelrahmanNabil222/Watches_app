import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BuyButtomSheetController extends GetxController {
  double totalAmount = 0;
  double totalprice = 0;
  double totalcost = 0;
// get the total numbers and price of the orders that i added to cart
  void getTotalNumbersAndPriceOfOrders() async {
    double totalamountt = 0;
    double totalpricee = 0;
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('userscart')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('orders')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    for (var fields in querySnapshot.docs) {
      totalamountt += fields['amount'];
      totalpricee += fields['priceoftotalamount'];
    }
    totalAmount = totalamountt;
    totalprice = totalpricee;
    totalcost = totalpricee + 10 + 50;

    update();
  }

  @override
  void onInit() {
    getTotalNumbersAndPriceOfOrders();
    super.onInit();
  }
}
