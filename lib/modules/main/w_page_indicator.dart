import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_svgs.dart';
import 'package:wedding_app/modules/main/c_main_controller.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageController controller = Get.find();
    return ValueListenableBuilder(
      valueListenable: controller.indicatorBarAnimatedValue,
      builder: (context, indicatorBarAnimatedValue, child) {
        return Opacity(
          opacity: indicatorBarAnimatedValue,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4000),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]
            ),
            padding: EdgeInsets.symmetric(
              vertical: (Get.height * 0.005),
              horizontal: (Get.height * 0.0075),
            ),
            child: Row(
              children: List.generate(4, (index) {
                String svgData = AppSvgs.homeIcon;
                switch(index){
                  case 0:
                    svgData = AppSvgs.homeIcon;
                    break;
                  case 1:
                    svgData = AppSvgs.storyIcon;
                    break;
                  case 2:
                    svgData = AppSvgs.weddingIcon;
                    break;
                  case 3:
                    svgData = AppSvgs.albumIcon;
                    break;
                }

                return Container(
                  width: Get.height * 0.05,
                  height: Get.height * 0.05,
                  margin: EdgeInsets.only(
                    left: index==0?0:Get.height * 0.0005,
                    right: index==3?0:Get.height * 0.0005,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: controller.currentPage,
                    builder: (context, currentPage, child) {
                      final xSelected = index == currentPage;
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          if(xSelected)ValueListenableBuilder(
                            valueListenable: controller.indicatorTabAnimatedValue,
                            builder: (context, animatedValue, child) {
                              return Opacity(
                                opacity: animatedValue,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.red
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            padding: EdgeInsets.all((Get.height * 0.012)),
                            child: SvgPicture.string(
                              svgData,
                              width: double.infinity,
                              height: double.infinity,
                              color: xSelected?AppColors.white:AppColors.brown,
                              // theme: SvgTheme(
                              //   currentColor: xSelected?AppColors.white:AppColors.brown,
                              // ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );

              }),
            ),
          ),
        );
      },
    );
  }
}
