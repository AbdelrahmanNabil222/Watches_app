import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watches_ecommerce/View/Screens/auth/start.dart';

import 'package:watches_ecommerce/View/Screens/home.dart';
import 'package:watches_ecommerce/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDyj0cgANv19YrlLlgFG5YUM3noeHf7hqE",
          appId: "1:327574995668:android:94658c987de8150c2f3141",
          messagingSenderId: "327574995668",
          projectId: "watches-ecommerce-6f4ec"));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: MyBindings(),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified != null)
            ? Home()
            : startpage());
  }
}
