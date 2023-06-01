import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/cart/cart_controller.dart';
import 'package:flutter_application_1/screens/signin_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ignore: deprecated_member_use, use_full_hex_values_for_flutter_colors
        backgroundColor: const Color(0xffffafafa),
        primaryColor: Color.fromARGB(255, 82, 101, 244),
        // ignore: deprecated_member_use
        accentColor: const Color(0xffffebc7),
      ),
      home: const SignInScreen(),
    );
  }
}
