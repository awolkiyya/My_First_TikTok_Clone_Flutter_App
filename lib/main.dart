import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tiktok/Controllers/auth.dart';
import 'package:my_tiktok/View/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => {
      Get.put(AuthController()),
    },
  );
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok Clone',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
