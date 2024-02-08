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
        final layoutSize = Size(constraints.maxWidth, constraints.maxHeight);
        return Container(
          width: layoutSize.width,
          margin: EdgeInsets.symmetric(
            horizontal: layoutSize.width*0.05,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.gold,
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 390/844,
              child: Container(
                width: double.infinity,
                height: Get.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(AppAssets.weddingBg).image,
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: controller.xDialogOpen,
                      builder: (context, xDialogOpen, child) {
                        return xDialogOpen
                            ? GestureDetector(
                                onTap: () {
                                  if (xDialogOpen) {
                                    controller.xDialogOpen.value = false;
                                    controller.xDialogOpen.notifyListeners();
                                  }
                                },
                                child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                    )),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    Column(
                      children: [
                        const Spacer(),
                        ValueListenableBuilder(
                          valueListenable: controller.xDialogOpen,
                          builder: (context, xDialogOpen, child) {
                            if (xDialogOpen) {
                              return Column(
                                children: [
                                  const WeddingMapWidget(),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: max(20, Get.height * 0.02),
                            bottom: Get.height * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.xDialogOpen.value =
                                      !controller.xDialogOpen.value;
                                  controller.xDialogOpen.notifyListeners();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: AppColors.white),
                                child: SvgPicture.string(AppSvgs.weddingMapIcon),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
