import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/shopController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Screens/ShopQuartizWatches.dart';
import 'package:watches_ecommerce/View/Screens/shopAutomaticwatches.dart';
import 'package:watches_ecommerce/View/Screens/shopMechanicalwatches.dart';
import 'package:watches_ecommerce/View/Screens/shopSolarWatches.dart';
import 'package:watches_ecommerce/View/Widgets/customContainer.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class Shop extends StatelessWidget {
  Shop({super.key});
  @override
  Widget build(BuildContext context) {
    final ShopController controller = Get.find();
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: AppColors.white1,
        appBar: AppBar(
            backgroundColor: AppColors.white1,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 2),
                child: CustomImageAsset(
                  image: 'images/shopping-bag.png',
                  height: 20,
                  width: 20,
                ),
              ),
              PopupMenuButton(
                  color: AppColors.black,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                            onTap: () {
                              Get.defaultDialog(
                                  title: 'LogOut?',
                                  content: Text('Do you want to LogOut'),
                                  onConfirm: () async {
                                    controller.signout();
                                  },
                                  onCancel: () {
                                    Get.back();
                                  });
                            },
                            child: CustomText(
                              text: 'LogOut',
                              color: AppColors.white,
                            ))
                      ])
            ],
            title: CustomText(
                text: 'Shop',
                color: AppColors.black,
                fontWeight: FontWeight.bold),
            bottom: TabBar(
                labelColor: AppColors.black1,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 14.1),
                indicatorColor: AppColors.black1,
                unselectedLabelColor: AppColors.gray1,
                tabs: [
                  CustomContainer(
                    width: 90,
                    height: 37,
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: AppColors.white,
                    child: Tab(
                        child: CustomText(
                      text: 'Quartiz',
                    )),
                  ),
                  CustomContainer(
                    width: 90,
                    height: 37,
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: AppColors.white,
                    child: Tab(
                        child: Text(
                      'Solar',
                    )),
                  ),
                  CustomContainer(
                    width: 90,
                    height: 37,
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: AppColors.white,
                    child: Tab(
                        child: Text(
                      'Auto',
                    )),
                  ),
                  CustomContainer(
                    width: 90,
                    height: 37,
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: AppColors.white,
                    child: Tab(
                        child: Text(
                      'Mechan',
                    )),
                  ),
                ])),
        body: SafeArea(
            child: Center(
          child: TabBarView(children: [
            ShopQuartizWatches(),
            ShopSolarWatches(),
            ShopAutomaticWatches(),
            ShopMechanicalWatches()
          ]),
        )),
      ),
    );
  }
}
