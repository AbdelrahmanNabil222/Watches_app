import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:watches_ecommerce/View/Screens/home.dart';

class StartPageController extends GetxController {
  //sign with google function
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.off(() => Home());
    userHeartColorsQuartiz();
    userHeartColorsAutomatic();
    userHeartColorsQuartizMechanical();
    userHeartColorsSolar();
  }

  // Giving Colors To the watches Hearts
  //i Use List of Watches Name to make every watch in the list take a color and name and make document with this information

//quartiz
  List namesquartiz = [
    {'name': "AK5000-54A"},
    {'name': "AN8130-09B"},
    {'name': "AN8204-59H"},
    {'name': "AN8200-50A"},
    {'name': "AN3680-37A"},
    {'name': "AN8210-56E"},
    {'name': "AK5003-05A"},
    {'name': "AN8204-59X"},
    {'name': "AN3681-57E"},
    {'name': "AN3690-56E"},
  ];
  //i will check if the Hearts of Quartiz products had been taken colors by user by sign ,before or not until the products hearts color doesnt added more than one
  //i will check by the documentttt that i will add it when i add the prouducts hearts colors
  //get the documentttt that its name is user email
  userHeartColorsQuartiz() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('shop')
        .doc('Pi66PkdpCvBisYttVXvL')
        .collection('heartsColors')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    //if you find this documentttt return false because in this case the prouducts hearts colors already added before
    if (querySnapshot.exists) {
      return false;
    }
    //if you dont find this documentttt
    else {
      //add the documentttt
      CollectionReference users = FirebaseFirestore.instance
          .collection('shop')
          .doc('Pi66PkdpCvBisYttVXvL')
          .collection('heartsColors');
      users.doc(FirebaseAuth.instance.currentUser!.email).set({'x': ''});
      //add the prouducts hearts colors
      int i = 0;
      while (i <= 9) {
        CollectionReference colorr = FirebaseFirestore.instance
            .collection('shop')
            .doc('Pi66PkdpCvBisYttVXvL')
            .collection('heartsColors');
        colorr.doc('${FirebaseAuth.instance.currentUser!.email}$i').set({
          'black': 4278190080,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
          'number': i,
          'name': namesquartiz[i]['name'],
        });

        i++;
      }
    }
  }

  ///solar
  List namessolar = [
    {'name1': "TISSOT-T03"},
    {'name1': "TISSOT-T09"},
    {'name1': "TISSOT-T32"},
    {'name1': "TISSOT-T12"},
    {'name1': "TISSOT-T10"},
    {'name1': "TISSOT-T45"},
    {'name1': "TISSOT-T03"},
    {'name1': "TISSOT-T12"},
  ];
  //i will check if the Hearts of Quartiz products had been taken colors by user by sign ,before or not until the products hearts color doesnt added more than one
  //i will check by the documentttt that i will add it when i add the prouducts hearts colors
  //get the documentttt that its name is user email
  userHeartColorsSolar() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('shop')
        .doc('ZT1i1Qaq1dpQB9cbgii3')
        .collection('heartsColors')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    //if you find this documentttt return false because in this case the prouducts hearts colors already added before
    if (querySnapshot.exists) {
      return false;
    } //if you dont find this documentttt
    else {
      //add the documentttt
      CollectionReference users = FirebaseFirestore.instance
          .collection('shop')
          .doc('ZT1i1Qaq1dpQB9cbgii3')
          .collection('heartsColors');
      users.doc(FirebaseAuth.instance.currentUser!.email).set({'x': ''});
      //add the prouducts hearts colors
      int i = 0;
      while (i <= 7) {
        CollectionReference colorr = FirebaseFirestore.instance
            .collection('shop')
            .doc('ZT1i1Qaq1dpQB9cbgii3')
            .collection('heartsColors');
        colorr.doc('${FirebaseAuth.instance.currentUser!.email}${i + 10}').set({
          'black': 4278190080,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
          'number': i + 10,
          'name': namessolar[i]['name1'],
        });

        i++;
      }
    }
  }

  ///Automatic
  List namesauto = [
    {'name': "NB6301-59L"},
    {'name': "NJ0151-88M"},
    {'name': "NS4131-88C"},
    {'name': "NA015E-43V"},
    {'name': "NP0456-67R"},
    {'name': "TI5687-43Y"},
  ];
  //i will check if the Hearts of Quartiz products had been taken colors by user by sign ,before or not until the products hearts color doesnt added more than one
  //i will check by the documentttt that i will add it when i add the prouducts hearts colors
  //get the documentttt that its name is user email
  userHeartColorsAutomatic() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('shop')
        .doc('NWOodtFIvsiGve18F0yk')
        .collection('heartsColors')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    //if you find this documentttt return false because in this case the prouducts hearts colors already added before
    if (querySnapshot.exists) {
      return false;
    }
    //if you dont find this documentttt
    else {
      //add the documentttt
      CollectionReference users = FirebaseFirestore.instance
          .collection('shop')
          .doc('NWOodtFIvsiGve18F0yk')
          .collection('heartsColors');
      users.doc(FirebaseAuth.instance.currentUser!.email).set({'x': ''});
      //add the prouducts hearts colors
      int i = 0;
      while (i <= 5) {
        CollectionReference colorr = FirebaseFirestore.instance
            .collection('shop')
            .doc('NWOodtFIvsiGve18F0yk')
            .collection('heartsColors');
        colorr.doc('${FirebaseAuth.instance.currentUser!.email}${i + 18}').set({
          'black': 4278190080,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
          'number': i + 18,
          'name': namesauto[i]['name'],
        });

        i++;
      }
    }
  }

  ///Mechanical
  List namesmech = [
    {'name': "WQ956E-83H"},
    {'name': "VE925E-83S"},
    {'name': "NE846O-92B"},
    {'name': "NX376P-02N"},
    {'name': "RE9376S-29J"},
    {'name': "AQ846I-94E"},
  ];
  //i will check if the Hearts of Quartiz products had been taken colors by user by sign ,before or not until the products hearts color doesnt added more than one
  //i will check by the documentttt that i will add it when i add the prouducts hearts colors
  //get the documentttt that its name is user email
  userHeartColorsQuartizMechanical() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('shop')
        .doc('7DhrUDzClGB3zRH2c277')
        .collection('heartsColors')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    //if you find this documentttt return false because in this case the prouducts hearts colors already added before
    if (querySnapshot.exists) {
      return false;
    }
    //if you dont find this documentttt
    else {
      //add the documentttt
      CollectionReference users = FirebaseFirestore.instance
          .collection('shop')
          .doc('7DhrUDzClGB3zRH2c277')
          .collection('heartsColors');
      users.doc(FirebaseAuth.instance.currentUser!.email).set({'x': ''});
      //add the prouducts hearts colors
      int i = 0;
      while (i <= 5) {
        CollectionReference colorr = FirebaseFirestore.instance
            .collection('shop')
            .doc('7DhrUDzClGB3zRH2c277')
            .collection('heartsColors');
        colorr.doc('${FirebaseAuth.instance.currentUser!.email}${i + 24}').set({
          'black': 4278190080,
          'id': FirebaseAuth.instance.currentUser!.uid,
          'email': FirebaseAuth.instance.currentUser!.email,
          'number': i + 24,
          'name': namesmech[i]['name'],
        });

        i++;
      }
    }
  }
}
