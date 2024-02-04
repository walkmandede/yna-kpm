import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/c_album_controller.dart';

class AlbumImageControlPanel extends StatelessWidget {
  const AlbumImageControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    AlbumController controller = Get.find();
    return Stack(
      children: [
        Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: controller.imagesScrollController,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.025),
                child: ValueListenableBuilder(
                  valueListenable: controller.currentImage,
                  builder: (context, currentImage, child) {
                    return Row(
                      children: controller.images.map((eachImage) {
                        bool xSelected = eachImage == currentImage;
                        return GestureDetector(
                          onTap: () {
                            controller.currentImage.value = eachImage;
                            controller.currentImage.notifyListeners();
                          },
                          child: Container(
                            width: controller.eachImageSize,
                            height: controller.eachImageSize,
                            margin: EdgeInsets.only(
                                right: controller.eachImageMargin),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: Image.asset(eachImage).image,
                                          fit: BoxFit.cover)),
                                ),
                                if (!xSelected)
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(0.7)),
                                  )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ))),
        Positioned(
            bottom: controller.eachImageSize / 2 + 10,
            child: GestureDetector(
              onTap: () {
                controller.imagesScrollController.animateTo(
                    controller.imagesScrollController.offset -
                        4 *
                            (controller.eachImageSize +
                                controller.eachImageMargin),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: AppColors.brown,
                ),
              ),
            )),
        Positioned(
            right: 0,
            bottom: controller.eachImageSize / 2 + 10,
            child: GestureDetector(
              onTap: () {
                controller.imagesScrollController.animateTo(
                    controller.imagesScrollController.offset +
                        4 *
                            (controller.eachImageSize +
                                controller.eachImageMargin),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppColors.brown,
                ),
              ),
            ))
      ],
    );
  }
}
