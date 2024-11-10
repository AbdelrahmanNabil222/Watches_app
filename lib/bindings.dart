import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/ShopQuartizWatchesController.dart';
import 'package:watches_ecommerce/Controller/buyBottomSheetController.dart';
import 'package:watches_ecommerce/Controller/cartController.dart';
import 'package:watches_ecommerce/Controller/favoritePageController.dart';
import 'package:watches_ecommerce/Controller/homeController.dart';
import 'package:watches_ecommerce/Controller/productDetailsController.dart';
import 'package:watches_ecommerce/Controller/shopAutomaticwatchesController.dart';
import 'package:watches_ecommerce/Controller/shopController.dart';
import 'package:watches_ecommerce/Controller/shopMechanicalwatchesController.dart';
import 'package:watches_ecommerce/Controller/shopSolarWatchesController.dart';
import 'package:watches_ecommerce/Controller/startPageController.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ShopController(), fenix: true);
    Get.lazyPut(() => ShopAutomaticWatchesController(), fenix: true);
    Get.lazyPut(() => ShopMechanicalWatchesController(), fenix: true);
    Get.lazyPut(() => ShopSolarWatchesController(), fenix: true);
    Get.lazyPut(() => ShopQuartizWatchesController(), fenix: true);
    Get.lazyPut(() => StartPageController(), fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => BuyButtomSheetController(), fenix: true);
    Get.lazyPut(() => FavoritePageController(), fenix: true);
  }
}
