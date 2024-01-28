import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_constants.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/v_album_page.dart';
import 'package:wedding_app/modules/main/home/v_home_page.dart';
import 'package:wedding_app/modules/main/story/v_story_page.dart';
import 'package:wedding_app/modules/main/w_page_indicator.dart';
import 'package:wedding_app/modules/main/wedding/v_wedding_page.dart';

import 'c_main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final pageSize = Size(constraints.maxWidth,constraints.maxHeight);
        return Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: controller.pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  controller.onPageChange(pageIndex: value);
                },
                allowImplicitScrolling: false,
                children: const[
                  HomePage(),
                  StoryPage(),
                  WeddingPage(),
                  AlbumPage()
                ],
              ),
              Positioned(
                bottom: (pageSize.width*0.075*getScreenScaleFactor()),
                left: (pageSize.width*0.075*getScreenScaleFactor()),
                child: const PageIndicator(),
              )
            ],
          ),
        );
      },
    );
  }

  // Widget page1(){
  //   final controller = Get.put(HomeController());
  //   return const Center(
  //     child: Text("Page 1"),
  //   );
  // }
  //
  // Widget page2(){
  //   final controller = Get.put(HomeController());
  //   return SizedBox.expand(
  //     child: ListView.builder(
  //       controller: controller.scrollController,
  //       itemCount: 30,
  //       key: const PageStorageKey('page2'),
  //       physics: const BouncingScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return Container(
  //           width: double.infinity,
  //           margin: const EdgeInsets.all(30),
  //           alignment: Alignment.center,
  //           child: Text(
  //             "Page 2.${index+1}"
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  //
  // Widget page3(){
  //   final controller = Get.put(HomeController());
  //   return const Center(
  //     child: Text("Page 3"),
  //   );
  // }

}
