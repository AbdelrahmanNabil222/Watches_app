import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/buyBottomSheetController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Widgets/customDivider.dart';
import 'package:watches_ecommerce/View/Widgets/customElevatedButton.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class BuyModalBtmSheet extends StatelessWidget {
  BuyModalBtmSheet({super.key});
  @override
  Widget build(BuildContext context) {
    // final BuyButtomSheetController controller = Get.find();
    return GetBuilder<BuyButtomSheetController>(builder: (controller) {
      return Column(
        children: [
          CustomDivider(
            width: 70,
            thickness: 3,
            color: AppColors.gray1,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: 'Number of purchases',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 102,
                ),
                CustomText(
                    text: '${controller.totalAmount}',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              CustomText(
                  text: 'Sub-Total',
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              SizedBox(
                width: 170,
              ),
              CustomText(
                  text: '${'\$'}${controller.totalprice}',
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ]),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: 'Delivery Free',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 145,
                ),
                CustomText(
                    text: '\$10.00',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: 'Discount',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 178,
                ),
                CustomText(
                    text: '\$50.00',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomDivider(thickness: 1, color: AppColors.gray1),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomText(
                    text: 'Total Cost',
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  width: 160,
                ),
                CustomText(
                    text: '\$${controller.totalcost}',
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          SizedBox(
            height: 105,
          ),
          CustomElevatedButton(
              onPressed: () {},
              text: 'Proceed to Checkout',
              fontSize: 17,
              textcolor: AppColors.white,
              backgroundColor: MaterialStateProperty.all(AppColors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(70, 10, 70, 10))),
        ],
      );
    });
  }
}
