import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/favoritePageController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Screens/productDetails.dart';
import 'package:watches_ecommerce/View/Widgets/customIcon.dart';
import 'package:watches_ecommerce/View/Widgets/customIconButton.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customImageNetwort.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class favoritepage extends StatelessWidget {
  favoritepage({super.key});

  @override
  Widget build(BuildContext context) {
    //final FavoritePageController controller = Get.find();
    return GetBuilder<FavoritePageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white1,
            title: CustomText(
              text: 'Favorite',
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CustomImageAsset(
                  image: 'images/heart.png',
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.white1,
          body: SafeArea(
            child: ListView(children: [
              Wrap(
                children: [
                  ...List.generate(
                    controller.data.length,
                    (i) => InkWell(
                      onTap: () {
                        Get.to(() => productdetails(
                              image: controller.data[i]['image'].toString(),
                              price: controller.data[i]['price'],
                              watchname: controller.data[i]['name'],
                            ));
                      },
                      child: Container(
                        width: 160,
                        // color: Colors.amber,
                        margin: EdgeInsets.fromLTRB(15, 10, 0, 12),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CustomImegeNetwork(
                                    image: controller.data[i]['image'],
                                    height: 150,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    left: 118,
                                    bottom: 110,
                                    child: CustomIconButton(
                                      onPressed: () async {
                                        // Remove the doc from the favorite page
                                        controller
                                            .removeTheProductFromFavoritePage(
                                                docid: controller.data[i].id);
                                        //
                                        //if the type in the doc is Quartiz
                                        if (controller.data[i]['type'] ==
                                            'Quartiz') {
                                          //change the Quartizs product heart color to black in the shopPage
                                          controller.returnColorToBlackQuartiz(
                                              controller.data[i]['number']);
                                        }
                                        //
                                        //if the type in the doc is Solar
                                        if (controller.data[i]['type'] ==
                                            'Solar') {
                                          //change the solars product heart color to black in the shopPage
                                          controller.returnColorToBlackSolar(
                                              controller.data[i]['number']);
                                        }
                                        //
                                        //if the type in the doc is Automatics
                                        if (controller.data[i]['type'] ==
                                            'Auto') {
                                          //change the Automatics product heart color to black in the shopPage
                                          controller.returnColorToBlackAuto(
                                              controller.data[i]['number']);
                                        }
                                        //
                                        //if the type in the doc is mechanicals
                                        if (controller.data[i]['type'] ==
                                            'Mechan') {
                                          //change the Mechanicals product heart color to black in the shopPage
                                          controller.returnColorToBlackMechan(
                                              controller.data[i]['number']);
                                        }
                                      },
                                      icon: CustomImageAsset(
                                          image: 'images/heart.png',
                                          height: 20,
                                          width: 20,
                                          color: AppColors.red1),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CustomText(
                                    text: controller.data[i]['name'],
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.gray2),
                                SizedBox(
                                  width: 16,
                                ),
                                Row(
                                  children: [
                                    CustomIcon(
                                      icon: Icons.star,
                                      color: AppColors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 3),
                                    CustomText(
                                        text: controller.data[i]['rate']
                                            .toString(),
                                        fontSize: 15,
                                        color: AppColors.gray1),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                    text:
                                        '${'\$'}${controller.data[i]['price']}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                SizedBox(
                                  width: 60,
                                ),
                                CustomImageAsset(
                                  image: 'images/arrow-right.png',
                                  color: AppColors.white1,
                                  height: 25,
                                  width: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ));
    });
  }
}
