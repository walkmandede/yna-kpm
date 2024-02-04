import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_functions.dart';
import '../../../constants/app_assets.dart';
import '../c_main_controller.dart';
import '../story/c_story_controller.dart';

class AlbumController extends GetxController{

  ScrollController scrollController = ScrollController();
  ValueNotifier<ScrolledState> currentScrollState = ValueNotifier(ScrolledState.top);

  ValueNotifier<String> currentImage = ValueNotifier("");
  ScrollController imagesScrollController = ScrollController();

  List<String> images = [
    AppAssets.a1,
    AppAssets.a2,
    AppAssets.a3,
    AppAssets.a4,
    AppAssets.a5,
    AppAssets.a6,
    AppAssets.a7,
    AppAssets.a8,
  ];

  final eachImageSize = Get.height * 0.1;
  final eachImageMargin = Get.height*0.02*0.5;


  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    scrollController.dispose();
    currentImage.removeListener(() { });
    currentScrollState.dispose();
    currentImage.dispose();
    super.onClose();
  }

  Future<void> initLoad() async{
    MainPageController mainController = Get.find();
    final imageScrollPadding = Get.height*0.025;
    currentImage.addListener(() {
      if(imagesScrollController.hasClients){
        final currentIndex = images.indexOf(currentImage.value);
        imagesScrollController.animateTo(eachImageMargin+(imageScrollPadding+((eachImageSize+eachImageMargin)*currentIndex)), duration: const Duration(milliseconds: 500), curve: Curves.linear);
      }
    });

    //setScrollListener
    scrollController.addListener(() async{
      if(mainController.pageController.page == 3) {
        final scrolledValue = scrollController.position.pixels;
        switch(currentScrollState.value){
          case ScrolledState.top:
            if(scrolledValue>0){
              //scrolling
              currentScrollState.value = ScrolledState.mid;
              currentScrollState.notifyListeners();
            }
            else if(scrolledValue<0){
              //goingToPrevPage
              mainController.pageController.previousPage(duration: const Duration(milliseconds: 600), curve: Curves.linear);
              // mainController.pageController.animateToPage(2, duration: const Duration(milliseconds: 250), curve: Curves.linear);
            }
            break;
          case ScrolledState.mid:
            final maxValue = scrollController.position.maxScrollExtent;
            if(scrolledValue>maxValue){
              await Future.delayed(const Duration(milliseconds: 1000));
              currentScrollState.value = ScrolledState.bottom;
              currentScrollState.notifyListeners();
            }
            else if(scrolledValue<0){
              await Future.delayed(const Duration(milliseconds: 1000));
              currentScrollState.value = ScrolledState.top;
              currentScrollState.notifyListeners();
            }
            break;
          case ScrolledState.bottom:
            final maxValue = scrollController.position.maxScrollExtent;
            if(scrolledValue>maxValue){
              //goingToNextPage
              mainController.pageController.animateToPage(4, duration: const Duration(milliseconds: 250), curve: Curves.linear);

            }
            else if(scrolledValue<maxValue){
              //scrolling
              currentScrollState.value = ScrolledState.mid;
              currentScrollState.notifyListeners();
            }
            break;
        }
      }
    });
  }


}