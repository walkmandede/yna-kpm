import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/modules/_test/mongo_test_page.dart';
import 'package:wedding_app/modules/main/c_main_controller.dart';
import 'package:wedding_app/modules/main/story/v_story_page.dart';
import 'package:wedding_app/modules/main/v_main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brown),
        useMaterial3: false,
      ),
      // home: const MongoTestPage(),
      home: const MainPage(),
    );
  }
}