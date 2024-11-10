import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/View/Screens/cart.dart';
import 'package:watches_ecommerce/View/Screens/favorite.dart';
import 'package:watches_ecommerce/View/Screens/shop.dart';

class HomeController extends GetxController {
  int selected = 0;
  //the List of bottomNavigationBar
  List pages = [Shop(), cartpage(), favoritepage()];
  thebottomNavBarOnTap({var val}) {
    selected = val;
    update();
  }

  //check the internet
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
