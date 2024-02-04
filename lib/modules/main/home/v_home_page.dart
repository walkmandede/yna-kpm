import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/modules/main/home/c_home_controller.dart';
import 'package:wedding_app/modules/main/home/w_wish_form_page.dart';

import '../../../constants/app_svgs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = Size(constraints.maxWidth,constraints.maxHeight);
        return Container(
          width: double.infinity,
          height: double.infinity,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: Image.asset(AppAssets.homeBg).image,
          //         fit: BoxFit.cover
          //     )
          // ),
          child: Stack(
            children: [
              //todo - here gonna be bg will page view horizontal scroll ( indicator lay pr yin po kg ml )
              Column(
                children: [
                  (Get.mediaQuery.padding.top).heightBox(),
                  (layoutSize.height * 0.005).heightBox(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: (layoutSize.width)* 0.1
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              "We are getting married",
                              style: GoogleFonts.alexBrush(
                                  fontSize: 2000,
                                  color: AppColors.red
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: controller.xDialogOpen,
                builder: (context, xWishFormOpen, child) {
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.bgGrey.withOpacity(xWishFormOpen?0.65:0)
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  const Spacer(),
                  ValueListenableBuilder(
                    valueListenable: controller.xDialogOpen,
                    builder: (context, xWishFormOpen, child) {
                      if(xWishFormOpen){
                        return const HomeWishFormWidget();
                      }
                      else{
                        return Container();
                      }
                    },
                  ),
                  Text(
                    "#ynakpmlove",
                    style: TextStyle(
                      color: AppColors.bgGrey.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: max(20,Get.height * 0.02),
                      bottom: Get.height * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.xDialogOpen.value = !controller.xDialogOpen.value;
                            controller.xDialogOpen.notifyListeners();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                              backgroundColor: AppColors.bgYellow
                          ),
                          child: SvgPicture.string(AppSvgs.wishUsIcon),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
