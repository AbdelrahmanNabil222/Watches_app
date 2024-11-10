import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/cartController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/Core/standard/Icons.dart';
import 'package:watches_ecommerce/View/Screens/buybottomsheet.dart';
import 'package:watches_ecommerce/View/Widgets/customDivider.dart';
import 'package:watches_ecommerce/View/Widgets/customElevatedButton.dart';
import 'package:watches_ecommerce/View/Widgets/customIconButton.dart';
import 'package:watches_ecommerce/View/Widgets/customImageNetwort.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class cartpage extends StatelessWidget {
  cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('userscart')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection('orders')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading"));
          }
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: CustomText(
                  text: 'My Cart',
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, i) {
                          return CustomDivider(
                            thickness: 0.3,
                            color: AppColors.black,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onLongPress: () async {
                              Get.defaultDialog(
                                  confirmTextColor: AppColors.white,
                                  cancelTextColor: AppColors.black,
                                  backgroundColor: AppColors.white,
                                  title: 'Remove?',
                                  titleStyle: TextStyle(
                                      color: AppColors.black, fontSize: 18),
                                  content: CustomText(
                                    text: 'Remove from your cart',
                                    color: AppColors.black,
                                  ),
                                  buttonColor: AppColors.black,
                                  onConfirm: () async {
                                    //remove the product from the cart
                                    controller.removeTheProductFromCart(
                                        docid: snapshot.data!.docs[i].id);
                                    Get.back();
                                  },
                                  textConfirm: 'yes',
                                  onCancel: () {
                                    Get.back();
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 12, 0, 3),
                              color: AppColors.white,
                              child: Row(
                                children: [
                                  CustomImegeNetwork(
                                    image: snapshot.data!.docs[i]['image'],
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                          text:
                                              '${snapshot.data!.docs[i]['name']}\n${snapshot.data!.docs[i]['size']}${' mm'}\n${'\$'}${snapshot.data!.docs[i]['priceoftotalamount']}'
                                                  .toString(),
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)
                                    ],
                                  ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 49),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 28,
                                          width: 29,
                                          child: CustomIconButton(
                                              iconSize: 20,
                                              onPressed: () async {
                                                // decrementing the Amount Of The Product
                                                controller
                                                    .decrementTheProductAmount(
                                                        docid: snapshot
                                                            .data!.docs[i].id);
                                                //The price oF Total Amount of Product after increment or decrement the amount
                                                controller.priceoFTotalAmountofProduct(
                                                    docid: snapshot
                                                        .data!.docs[i].id,
                                                    operation: (snapshot.data!
                                                                    .docs[i]
                                                                ['amount'] *
                                                            snapshot.data!
                                                                    .docs[i][
                                                                'priceofonepiece']) -
                                                        snapshot.data!.docs[i][
                                                            'priceofonepiece']);
                                              },
                                              icon: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 9),
                                                child: Icon(
                                                  AppIcons.minimize,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.white1),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)))),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        GetBuilder<CartController>(
                                            builder: (controllerr) {
                                          return Text(
                                            snapshot.data!.docs[i]['amount']
                                                .toString(),
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Container(
                                          height: 28,
                                          width: 29,
                                          child: CustomIconButton(
                                              iconSize: 20,
                                              onPressed: () async {
                                                // incrementing the Amount Of The Product
                                                controller
                                                    .incrementTheProductAmount(
                                                        docid: snapshot
                                                            .data!.docs[i].id);
                                                //The price oF Total Amount of Product after increment or decrement the amount
                                                controller.priceoFTotalAmountofProduct(
                                                    docid: snapshot
                                                        .data!.docs[i].id,
                                                    operation: (snapshot.data!
                                                                    .docs[i]
                                                                ['amount'] *
                                                            snapshot.data!
                                                                    .docs[i][
                                                                'priceofonepiece']) +
                                                        snapshot.data!.docs[i][
                                                            'priceofonepiece']);
                                              },
                                              icon: Icon(
                                                AppIcons.add,
                                                color: AppColors.white,
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColors.black1),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(0)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)))),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 8,
                      ),
                      child: CustomElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: AppColors.white,
                                context: context,
                                builder: (context) {
                                  return BuyModalBtmSheet();
                                });
                          },
                          text: 'Buy Now',
                          textcolor: AppColors.white,
                          fontSize: 17,
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.black),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(70, 8, 70, 8))))
                ],
              ),
            )),
          );
        });
  }
}
