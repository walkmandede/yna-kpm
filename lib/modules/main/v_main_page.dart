import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_constants.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/v_album_page.dart';
import 'package:wedding_app/modules/main/home/v_home_page.dart';
import 'package:wedding_app/modules/main/rsvp/v_rsvp_page.dart';
import 'package:wedding_app/modules/main/story/v_story_page.dart';
import 'package:wedding_app/modules/main/w_page_indicator.dart';
import 'package:wedding_app/modules/main/wedding/v_wedding_page.dart';

import '../../constants/app_assets.dart';
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(AppAssets.webViewBg).image,
                      fit: BoxFit.fill,
                    )
                  ),
                ),
                const  AspectRatio(
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
    controller.precacheImages();
    return LayoutBuilder(
      builder: (context, constraints) {
        final pageSize = Size(constraints.maxWidth,constraints.maxHeight);
        return ValueListenableBuilder(
          valueListenable: controller.xCachedCompleted,
          builder: (context, xCachedCompleted, child) {
            if(!xCachedCompleted){
              return Material(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgYellow,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Loading please wait ...\nThank for visiting our wedding website",
                    style: GoogleFonts.alexBrush(
                      fontSize: 26,
                      color: AppColors.red
                    ),
                  ),
                )
              );
            }
            else{
              return const Scaffold(
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          HomePage(),
                          StoryPage(),
                          WeddingPage(),
                          AlbumPage(),
                          RsvpPage()
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}


