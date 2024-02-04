import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/modules/main/wedding/c_wedding_controller.dart';
import 'package:wedding_app/modules/main/wedding/w_wedding_map_widget.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_svgs.dart';
import '../home/c_home_controller.dart';
import '../home/w_wish_form_page.dart';

class WeddingPage extends StatelessWidget {
  const WeddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WeddingController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = Size(constraints.maxWidth,constraints.maxHeight);
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(AppAssets.weddingBg).image,
                  fit: BoxFit.fill
              )
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  (Get.mediaQuery.padding.top).heightBox(),
                  (Get.height * 0.005).heightBox(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.1
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
                builder: (context, xDialogOpen, child) {
                  return GestureDetector(
                    onTap: () {
                      if(xDialogOpen){
                        controller.xDialogOpen.value = false;
                        controller.xDialogOpen.notifyListeners();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.bgGrey.withOpacity(xDialogOpen?0.65:0)
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
                    builder: (context, xDialogOpen, child) {
                      if(xDialogOpen){
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: min(30, Get.height * 0.05)
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.red,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: min(10, Get.height * 0.015),
                                  vertical: min(10,Get.height * 0.015)
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nyaung Kan Aye TharThaNa YeikThar\n(Insein Kyo Kone)",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.jomolhari(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  5.heightBox(),
                                  Text(
                                    "Insein Road, Insein Township,\nNear Gyo Kone Bus Stop, Yangon",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            5.heightBox(),
                            const WeddingMapWidget(),
                          ],
                        );
                      }
                      else{
                        return Container();
                      }
                    },
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
                          child: SvgPicture.string(AppSvgs.weddingMapIcon),
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
