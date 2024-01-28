import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_functions.dart';

class MainPageController extends GetxController with GetTickerProviderStateMixin{
  PageController pageController = PageController(
    initialPage: 0
  );

  AnimationController? indicatorTabAnimation;
  ValueNotifier<double> indicatorTabAnimatedValue = ValueNotifier(0);

  ValueNotifier<int> currentPage = ValueNotifier(0);

  AnimationController? indicatorBarAnimation;
  ValueNotifier<double> indicatorBarAnimatedValue = ValueNotifier(0);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    pageController.removeListener(() { });
    pageController.dispose();
    if(indicatorTabAnimation!=null){
      indicatorTabAnimation!.removeListener(() { });
      indicatorTabAnimation!.dispose();
    }
    super.onClose();
  }

  Future<void> initLoad() async{

    //setAnimator
    indicatorTabAnimation = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    indicatorTabAnimation!.addListener(() {
      indicatorTabAnimatedValue.value = indicatorTabAnimation!.value;
      indicatorTabAnimatedValue.notifyListeners();
    });
    indicatorTabAnimation!.forward().then((value) async{
      await Future.delayed(const Duration(milliseconds: 3500));
      indicatorBarAnimation!.reverse();
    });

    indicatorBarAnimation = AnimationController(vsync: this,duration: const Duration(milliseconds: 1500));
    indicatorBarAnimation!.addListener(() {
      indicatorBarAnimatedValue.value = indicatorBarAnimation!.value;
      indicatorBarAnimatedValue.notifyListeners();
    });
    indicatorBarAnimation!.forward();
  }

  Future<void> onPageChange({required int pageIndex}) async{

    currentPage.value = pageIndex;
    currentPage.notifyListeners();

    // indicatorTabAnimation!.reverse().then((value) async{
    //   await Future.delayed(const Duration(milliseconds: 100));
    //   currentPage.value = pageIndex;
    //   currentPage.notifyListeners();
    //   indicatorTabAnimation!.reset();
    //   indicatorTabAnimation!.forward();
    // });

    indicatorBarAnimation!.reset();
    indicatorBarAnimation!.forward().then((value) async{
      await Future.delayed(const Duration(milliseconds: 3500));
      indicatorBarAnimation!.reverse();
    });

  }

}