import 'package:flutter/material.dart';
import 'package:watches_ecommerce/Core/standard/Colors.dart';
import 'package:watches_ecommerce/View/Widgets/customImageAsset.dart';
import 'package:watches_ecommerce/View/Widgets/customText.dart';

class InternetConnectionPage extends StatelessWidget {
  const InternetConnectionPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageAsset(
              image: 'images/internet.PNG',
            ),
            SizedBox(height: 50),
            CustomText(
              text:
                  'No internet connection\nfound,check your connection\nand try again.',
              textAlign: TextAlign.center,
              fontSize: 18,
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
