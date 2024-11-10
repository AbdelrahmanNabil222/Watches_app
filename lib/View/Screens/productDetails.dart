import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/productDetailsController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Screens/home.dart';
import 'package:watches_ecommerce/View/Screens/internetConnectionPage.dart';
import 'package:watches_ecommerce/View/Widgets/customContainer.dart';
import 'package:watches_ecommerce/View/Widgets/customDivider.dart';
import 'package:watches_ecommerce/View/Widgets/customElevatedButton.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customImageNetwort.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class productdetails extends StatelessWidget {
  productdetails({super.key, this.image, this.price, this.watchname});
  final String? image;
  final String? price;
  final String? watchname;

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsController controller = Get.find();
    return GetBuilder<ProductDetailsController>(builder: (controller) {
      return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            return (controller.internetStatus == ConnectivityResult.none ||
                    snapshot.data == ConnectivityResult.none)
                ? InternetConnectionPage()
                : Scaffold(
                    appBar: AppBar(
                      backgroundColor: AppColors.white,
                      actions: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: CustomImageAsset(
                            image: 'images/shopping-bag.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                    body: SafeArea(
                        child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Container(
                          color: AppColors.white,
                          height: 300,
                          child: CustomImegeNetwork(
                            image: image.toString(),
                            height: 300,
                            width: 363,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        CustomContainer(
                          height: 328.3,
                          backgroundColor: AppColors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              CustomDivider(
                                width: 70,
                                thickness: 3,
                                color: AppColors.gray1,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: CustomText(
                                      text: '${'\$'}$price',
                                      fontSize: 22,
                                      color: AppColors.gray1,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 170,
                                  ),
                                  CustomImageAsset(
                                    image: 'images/q.jpg',
                                    height: 34,
                                    width: 34,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 186),
                                child: CustomText(
                                  text: '$watchname',
                                  fontSize: 18,
                                  color: AppColors.gray1,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: 'Choose your size (mm)',
                                    fontSize: 18,
                                    color: AppColors.gray1,
                                  ),
                                  SizedBox(
                                    width: 52,
                                  ),
                                  CustomText(
                                    text: 'Size guide',
                                    fontSize: 18,
                                    color: AppColors.gray1,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 80),
                                child: CustomRadioButton(
                                  selectedBorderColor: AppColors.black,
                                  unSelectedBorderColor: AppColors.black,
                                  spacing: 1,
                                  shapeRadius: 0,
                                  radius: 0,
                                  padding: 10,
                                  buttonTextStyle: ButtonTextStyle(
                                      selectedColor: AppColors.white,
                                      unSelectedColor: AppColors.white),
                                  // height: 45,
                                  width: 49,
                                  elevation: 0,
                                  buttonLables: ['28', '32', '36', '40'],
                                  buttonValues: ['28', '32', '36', '40'],
                                  radioButtonValue: (val) {
                                    controller.sizevalue = val;
                                  },
                                  unSelectedColor: AppColors.black1,
                                  selectedColor: AppColors.gray1,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomElevatedButton(
                                  onPressed: () {
                                    //if the user doesnt choose a size to the watch
                                    if (controller.sizevalue == null) {
                                      Get.defaultDialog(
                                          content: Text(
                                            'please choose size',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          titleStyle: TextStyle(fontSize: 22),
                                          title: 'size ?');
                                    }
                                    //if the user choose a size to the watch and clicked the Add to cart button
                                    else {
                                      //add the order to cart
                                      controller.addUserOrder(
                                          watchname: watchname,
                                          price: price,
                                          image: image);
                                      Get.offAll(() => Home());
                                      Get.snackbar('Check your cart', '',
                                          messageText: Text(
                                            'Had been added to your cart',
                                            style: TextStyle(fontSize: 15),
                                          ));
                                    }
                                  },
                                  text: 'ADD TO CART',
                                  fontSize: 17,
                                  textcolor: AppColors.black,
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.white),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(85, 8, 85, 8))),
                            ],
                          ),
                        )
                      ],
                    )),
                  );
          });
    });
  }
}
