import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/Controller/startPageController.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class startpage extends StatelessWidget {
  startpage({super.key});

  @override
  Widget build(BuildContext context) {
    final StartPageController controller = Get.find();

    return Stack(children: [
      CustomImageAsset(
        image: 'images/q.jpg',
        fit: BoxFit.fill,
      ),
      Positioned(
        top: 630,
        left: 80,
        child: ElevatedButton.icon(
          onPressed: () {
            controller.signInWithGoogle();
          },
          icon: CustomImageAsset(
            height: 25,
            width: 25,
            image: 'images/search.png',
            color: AppColors.white,
          ),
          label: CustomText(
            text: 'View Gallary',
            color: AppColors.white,
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.black),
              padding:
                  MaterialStateProperty.all(EdgeInsets.fromLTRB(42, 6, 42, 6)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              side: MaterialStateProperty.all(
                  BorderSide(color: AppColors.amber))),
        ),
      )
    ]);
  }
}
