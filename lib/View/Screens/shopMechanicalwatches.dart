import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/shopMechanicalwatchesController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Screens/productDetails.dart';
import 'package:watches_ecommerce/View/Widgets/customIcon.dart';
import 'package:watches_ecommerce/View/Widgets/customIconButton.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customImageNetwort.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class ShopMechanicalWatches extends StatelessWidget {
  ShopMechanicalWatches({super.key});

  // final ShopMechanicalWatchesController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('shop')
            .doc('7DhrUDzClGB3zRH2c277')
            .collection('heartsColors')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('number', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }
          return GetBuilder<ShopMechanicalWatchesController>(
              builder: (controller) {
            return ListView(children: [
              Wrap(
                children: [
                  ...List.generate(
                    controller.data.length,
                    (index) => InkWell(
                      onTap: () {
                        Get.to(() => productdetails(
                              image: controller.data[index]['image'],
                              price: controller.data[index]['price'],
                              watchname: controller.data[index]['name'],
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
                                    image: controller.data[index]['image'],
                                    //'images/zzz.PNG',
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
                                        //if the product heart is black in shop
                                        if (snapshot.data!.docs[index]
                                                ['black'] ==
                                            4278190080) {
                                          //add the product to favorite
                                          controller.addtofavoritee(
                                              name: controller.data[index]
                                                  ['name'],
                                              price: controller.data[index]
                                                  ['price'],
                                              image: controller.data[index]
                                                  ['image'],
                                              rate: controller.data[index]
                                                  ['rate'],
                                              number: controller.data[index]
                                                  ['number']);
                                          //make the product heart red in the shop
                                          controller.makingTheHeartRedinTheShop(
                                              docid: snapshot
                                                  .data!.docs[index].id);
                                        }
                                        //if the product heart is red in shop
                                        else if (snapshot.data!.docs[index]
                                                ['black'] ==
                                            4294198070) {
                                          //remove the product from favorite page
                                          controller.removeTheProdutFromFavorite(
                                              docid:
                                                  '${snapshot.data!.docs[index]['email']}${snapshot.data!.docs[index]['name']}');
                                          // make the product heart black in the shop
                                          controller
                                              .makingTheHeartBlackInTheShop(
                                                  docid: snapshot
                                                      .data!.docs[index].id);
                                        }
                                      },
                                      icon: CustomImageAsset(
                                        image: 'images/heart.png',
                                        color: Color(snapshot.data!.docs[index]
                                            ['black']),
                                        height: 18,
                                        width: 18,
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: controller.data[index]['name'],
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.black1,
                                ),
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
                                        text: controller.data[index]['rate']
                                            .toString(),
                                        fontSize: 15,
                                        color: AppColors.black1),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                    text:
                                        '\$${controller.data[index]['price'].toString()}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                                SizedBox(
                                  width: 61,
                                ),
                                CustomImageAsset(
                                  image: 'images/arrow-right.png',
                                  color: AppColors.gray1,
                                  //   color: const Color.fromARGB(255, 87, 114, 88),
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
            ]);
          });
        });
  }
}
