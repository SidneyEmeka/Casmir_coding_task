import 'package:casmir/onboarding/sign_in.dart';
import 'package:casmir/state/casmirx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //init notifications
  Get.put(Casmirx());
  runApp(const MyApp());
}

ThemeData _lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 0,),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF5925DC),
    secondary: Color(0xFF2E90FA),
    tertiary: Color(0xFF2C0A84),
  ),
  fontFamily: 'Aeonik',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),
    bodyMedium: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),
    bodySmall: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.white),
  ),
  scaffoldBackgroundColor: Colors.white,);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coding Task',
      theme: _lightTheme,
      home: const SignIn(),
    );
  }
}


