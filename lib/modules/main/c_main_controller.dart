
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
// import 'package:platform_device_id/platform_device_id.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/services/api_services.dart';
import 'package:wedding_app/services/dialog/dialog_service.dart';
import 'package:wedding_app/services/mongo_service.dart';
import 'package:http/http.dart' as http;

class MainPageController extends GetxController with GetTickerProviderStateMixin{
  PageController pageController = PageController(
    initialPage: 0
  );

  ValueNotifier<int> currentPage = ValueNotifier(0);
  AnimationController? indicatorBarAnimation;
  ValueNotifier<double> indicatorBarAnimatedValue = ValueNotifier(0);
  ValueNotifier<bool> xCachedCompleted = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    pageController.removeListener(() { });
    pageController.dispose();
    if(indicatorBarAnimation!=null){
      indicatorBarAnimation!.removeListener(() { });
      indicatorBarAnimation!.dispose();
    }
    super.onClose();
  }

  Future<void> initLoad() async{
    setDeviceInfo();
    indicatorBarAnimation = AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    indicatorBarAnimation!.addListener(() {
      indicatorBarAnimatedValue.value = indicatorBarAnimation!.value;
      indicatorBarAnimatedValue.notifyListeners();
    });
    indicatorBarAnimation!.forward();
    await Future.delayed(const Duration(milliseconds: 3500));
    indicatorBarAnimation!.reverse();
    precacheImages();
  }

  Future<void> onPageChange({required int pageIndex}) async{

    currentPage.value = pageIndex;
    currentPage.notifyListeners();

  }

  void animatedIndicatorBar(){
    indicatorBarAnimation!.reset();
    indicatorBarAnimation!.forward().then((value) async{
      await Future.delayed(const Duration(milliseconds: 3500));
      indicatorBarAnimation!.reverse();
    });
  }

  Future<void> precacheImages() async{
    try{
      await Future.wait([
        precacheImage(Image.asset(AppAssets.homeBg).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg1).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg2).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg3).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg4).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg5).image, Get.context!),
        precacheImage(Image.asset(AppAssets.homeBg6).image, Get.context!),
        precacheImage(Image.asset(AppAssets.weddingBg).image, Get.context!),
        precacheImage(Image.asset(AppAssets.rsvpBg).image, Get.context!),
        precacheImage(Image.asset(AppAssets.storyBg).image, Get.context!),
        precacheImage(Image.asset(AppAssets.storyMale).image, Get.context!),
        precacheImage(Image.asset(AppAssets.storyFemale).image, Get.context!),
        precacheImage(Image.asset(AppAssets.story3in1).image, Get.context!),
        precacheImage(Image.asset(AppAssets.story4).image, Get.context!),
        precacheImage(Image.asset(AppAssets.story3).image, Get.context!),
        precacheImage(Image.asset(AppAssets.storyEngage).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a1).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a2).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a3).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a4).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a5).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a6).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a7).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a8).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a9).image, Get.context!),
        precacheImage(Image.asset(AppAssets.a10).image, Get.context!),
      ]);

    }
    catch(e){
      null;
    }
    xCachedCompleted.value = true;
    xCachedCompleted.notifyListeners();
  }

  Future<void> setDeviceInfo() async{
    try{
      // if(kIsWeb){
      //   String? deviceId = await PlatformDeviceId.getDeviceId;
      //   http.post(
      //     // Uri.parse("https://xcar-brand.xsphere.co/brand"),
      //       Uri.parse("${ApiServices.baseUrl}/visiter"),
      //       headers: ApiServices.headers,
      //       body: jsonEncode({"deviceInfo" : deviceId})
      //     // body: jsonEncode({"deviceInfo" : deviceId})
      //   ).then((value) {
      //     superPrint(value.body,title: value.statusCode);
      //   });
      // }
    }catch(e){
      null;
    }
  }





}