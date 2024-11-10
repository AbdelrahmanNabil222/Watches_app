import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watches_ecommerce/View/Screens/auth/start.dart';

class ShopController extends GetxController {
  // signout function
  signout() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    Get.offAll(() => startpage());
  }
}
