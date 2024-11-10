import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/homeController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Screens/internetConnectionPage.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.find();
    return GetBuilder<HomeController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (controller.internetStatus == ConnectivityResult.none ||
                    snapshot.data == ConnectivityResult.none)
                ? InternetConnectionPage()
                : Scaffold(
                    bottomNavigationBar: BottomNavigationBar(
                      showUnselectedLabels: false,
                      selectedItemColor: AppColors.black,
                      backgroundColor: AppColors.white1,
                      unselectedItemColor: AppColors.gray1,
                      currentIndex: controller.selected,
                      items: [
                        BottomNavigationBarItem(
                            icon: CustomImageAsset(
                              image: 'images/shopping-bag.png',
                              height: 25,
                              width: 25,
                            ),
                            label: 'Shop'),
                        BottomNavigationBarItem(
                          icon: CustomImageAsset(
                            image: 'images/shopping-cart.png',
                            height: 25,
                            width: 25,
                          ),
                          label: 'Cart',
                        ),
                        BottomNavigationBarItem(
                          icon: CustomImageAsset(
                            image: 'images/heart.png',
                            height: 25,
                            width: 25,
                          ),
                          label: 'Favourite',
                        ),
                      ],
                      onTap: (vall) {
                        controller.thebottomNavBarOnTap(val: vall);
                      },
                    ),
                    body: controller.pages.elementAt(controller.selected),
                  );
          });
    });
  }
}
