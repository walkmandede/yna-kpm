import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/modules/main/c_main_controller.dart';

enum ScrolledState{
  top,
  mid,
  bottom
}

class StoryController extends GetxController{
  ScrollController scrollController = ScrollController();
  ValueNotifier<ScrolledState> currentScrollState = ValueNotifier(ScrolledState.top);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> initLoad() async{
    MainPageController mainController = Get.find();
    //setScrollListener
    scrollController.addListener(() async{
      mainController.animatedIndicatorBar();
      if(mainController.pageController.page == 1){
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
              mainController.animatedIndicatorBar();
              // mainController.pageController.animateToPage(0, duration: const Duration(milliseconds: 250), curve: Curves.linear);
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
              mainController.pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.linear);
              // mainController.pageController.animateToPage(2, duration: const Duration(milliseconds: 250), curve: Curves.linear);

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