import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_constants.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/v_album_page.dart';
import 'package:wedding_app/modules/main/home/v_home_page.dart';
import 'package:wedding_app/modules/main/rsvp/v_rsvp_page.dart';
import 'package:wedding_app/modules/main/story/v_story_page.dart';
import 'package:wedding_app/modules/main/w_page_indicator.dart';
import 'package:wedding_app/modules/main/wedding/v_wedding_page.dart';

import 'c_main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if(Get.width >= Get.height*0.75){
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.bgYellow,
            child: const Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 390/844,
                  child: MainViewPage(),
                )
              ],
            ),
          );
        }
        else{
          return const MainViewPage();
        }

        return Container();
      },
    );

  }

}

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final pageSize = Size(constraints.maxWidth,constraints.maxHeight);
        return Scaffold(
          body: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: controller.currentPage,
                builder: (context, currentPage, child) {
                  final xShouldScroll = currentPage==1||currentPage==3;
                  return PageView(
                    controller: controller.pageController,
                    scrollDirection: Axis.vertical,
                    physics: xShouldScroll?const NeverScrollableScrollPhysics():const ClampingScrollPhysics(),
                    onPageChanged: (value) {
                      controller.onPageChange(pageIndex: value);
                    },
                    allowImplicitScrolling: false,
                    children: const[
                      HomePage(),
                      StoryPage(),
                      WeddingPage(),
                      AlbumPage(),
                      RsvpPage()
                    ],
                  );
                },
              ),
              Positioned(
                bottom: (pageSize.width*0.075),
                right: (pageSize.width*0.075),
                child: const PageIndicator(),
              )
            ],
          ),
        );
      },
    );
  }
}

